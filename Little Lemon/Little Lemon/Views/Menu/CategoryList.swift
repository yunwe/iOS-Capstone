//
//  CategoryList.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 23/8/2567 BE.
//

import SwiftUI

private struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.title3)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(myGrey) // Optional: background color for better visibility
            .cornerRadius(8) // Rounded corners

    }
}

struct CategoryList: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @Binding var searchByTitle : Bool 
    @Binding var searchString : String
    
    
    @FetchRequest (sortDescriptors: [], animation: .default)
        private var dishes : FetchedResults<Dish>
    
    var body: some View {
        VStack{
            Text("ORDER FOR DELIVERY!")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(primary1)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            if(searchByTitle)
            {
                HStack{
                    TextField("Search...", text: $searchString)
                        .textFieldStyle(CustomTextFieldStyle())
                    Button("Cancel"){
                        searchString = ""
                        searchByTitle.toggle()
                    }
                }
                .padding(.bottom)
                
            }
            else{
                HStack(alignment: .center){
                    searchButton
                    Divider()
                        .frame(width: 1, height: 30)
                        .overlay(primary1)
                    
                    buildCategories()
                }
                .padding(.bottom)
            }
                
            
            Divider()
                .frame(height: 2)
                .overlay(myGrey)
         
        }
        .padding()
    }
    
    var searchButton : some View{
        Button(action: {
            searchString = ""
            searchByTitle.toggle()
        }) {
            Image(systemName: "magnifyingglass") // SF Symbol icon
                .resizable()
                .frame(width: 20, height: 20) // Adjust size
                .foregroundColor(primary1) // Adjust color
        }
        .padding(13)
        .background(Color.black.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    private func buildCategories() -> some View
    {
        var categories : Set<String> = []
        for dish in dishes{
            if(!Verification.isEmpty(dish.category))
            {
                categories.insert(dish.category!)
            }
        }
        
        let array = Array(categories).sorted()
        
        return ScrollView(.horizontal){
            HStack{
                ForEach(array, id: \.self){item in
                    CategoryItem(label: item, selected: $searchString)
                }
            }
        }
    }
}

struct CategoryItem : View{
    let label : String
    @Binding var selected : String
    
    var body : some View{
        Text(label)
            .foregroundStyle(label == selected ? myGrey : primary1)
            .fontWeight(.bold)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(label == selected ? primary1 : myGrey)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .onTapGesture {
                selected = selected == label ? "" : label
            }
        
    }
}

struct CategoryList_Previews: PreviewProvider {
    @State static private var selected : String = ""
    @State static private var option : Bool = false
    
    
    static let context = PersistenceController.shared.container.viewContext
    
    static var previews: some View {
        CategoryList(searchByTitle: $option, searchString: $selected)
            .environment(\.managedObjectContext, context)
    }
    
}
