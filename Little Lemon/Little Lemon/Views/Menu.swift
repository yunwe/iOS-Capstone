//
//  Menu.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 21/8/2567 BE.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var searchString = ""
    @State private var haveMenu = false
    
    
    var body: some View {
        VStack{
            Text("Little Lemon")
            Text("Chicago")
            Text("a short description of the whole application below the previous two fields.")
                .padding(.horizontal)
            
            NavigationView() {
                FetchedObjects(
                    predicate: buildPredicate(),
                    sortDescriptors: buildSortDescriptors()
                ) { (dishes: [Dish]) in
                    List{
                        ForEach(dishes){dish in
                            DishItem(dish: dish)
                        }
                    }
                }
                .searchable(text: $searchString, prompt: Text("Search Menu..."))
            }
            .onAppear(){
                if(haveMenu)
                {
                    return
                }
                    
                getMenuData()
                haveMenu = true
            }
        }
    }
    
    private func getMenuData()
    {
        //Delete all previous data
        PersistenceController.shared.clear()
        
        //Fetch from Remote Server
        let path = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        guard let url = URL(string: path)
        else{
            print("Failed to build url object \(path).")
            return
        }
        
        let request = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request){
            data, response, error in
            if let data = data {
                onSuccess(data)
            }
        }
        dataTask.resume()
    }
    
    private func onSuccess(_ data: Data){
        let menuList =  try? JSONDecoder().decode(MenuList.self, from: data)
        let menus = menuList?.menu ?? []
        for menu in menus {
            let dish = Dish(context: viewContext)
            dish.title = menu.title
            dish.category = menu.category
            dish.price = menu.price
            dish.desc = menu.description
            dish.image = menu.image
        }
        
        try? viewContext.save()
    }
    
    private func buildSortDescriptors() -> [NSSortDescriptor]{
        [NSSortDescriptor(key: "title", ascending: true, selector:  #selector(NSString.localizedStandardCompare))]
    }
    
    private func buildPredicate() -> NSPredicate{
        if(Verification.isEmpty(searchString))
        {
            return NSPredicate(value: true)
        }
        return NSPredicate(format: "title CONTAINS[cd] %@", searchString)
    }
}


private struct DishItem : View{
    let dish : Dish
    
    var body: some View {
        NavigationLink {
            Detail(dish: dish)
        } label: {
            HStack{
                if let imagePath = dish.image {
                    AsyncImage(url: URL(string: imagePath)){image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 72, height: 50)
                            .clipped()
                    }placeholder: {
                        ProgressView()
                    }
                    .frame(width: 72, height: 50)
                }
                else{
                    Color(.green)
                        .frame(width: .infinity, height: 250)
                }
                Text(dish.title ?? "")
                Spacer()
                Text(dish.price ?? "0")
                    .monospaced()
                    .font(.callout)
            }
        }
    }
    
}
//
//#Preview {
//    Menu()
//}
