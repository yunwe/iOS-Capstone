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
    @State private var searchByTitle : Bool = false
    
    @State private var haveMenu = false
    
    
    var body: some View {
       
        VStack{
            CategoryList(searchByTitle: $searchByTitle, searchString: $searchString)
                .environment(\.managedObjectContext, viewContext)
            
            FetchedObjects(
                predicate: buildPredicate(),
                sortDescriptors: buildSortDescriptors()
            ) { (dishes: [Dish]) in
                
                ForEach(dishes){dish in
                    DishItem(dish: dish)
                }
            }
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
        if(Verification.isEmpty(searchString)){
            return NSPredicate(value: true)
        }
        
        if(searchByTitle){
            return NSPredicate(format: "title CONTAINS[cd] %@ ", searchString)
        }
        else{
            return NSPredicate(format: "category == %@", searchString)
        }
    }
}




private struct DishItem : View{
    let dish : Dish
    
    var body: some View {
        NavigationLink {
            Detail(dish: dish)
        } label: {
            VStack(alignment: .leading){
                Text(dish.title ?? "")
                    .font(.title2)
                    .foregroundStyle(.black)
                    .fontWeight(.medium)
                HStack{
                    VStack(alignment: .leading){
                        Text(dish.desc ?? "")
                            .foregroundStyle(primary1)
                            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.leading)
                        Spacer()
                        Text(dish.price ?? "0")
                            .foregroundStyle(primary1)
                            .fontWeight(.medium)
                            .monospaced()
                            .font(.callout)
                            
                    }
                    Rectangle()
                        .frame(width: 10)
                        .foregroundColor(.clear)
                    //image
                    if let imagePath = dish.image {
                        AsyncImage(url: URL(string: imagePath)){image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 90, height: 90)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }placeholder: {
                            ProgressView()
                        }
                    }
                    else{
                        Color(.green)
                            .frame(width: .infinity, height: 250)
                    }
                    //End of image
                    
                }//</HStack>
                Divider()
            }
            .padding()
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static let context = PersistenceController.shared.container.viewContext
    let dish = Dish(context: context)
    static var previews: some View {
        Menu()
            .environment(\.managedObjectContext, context)
    }
}
