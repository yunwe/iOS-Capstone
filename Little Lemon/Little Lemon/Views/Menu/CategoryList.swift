//
//  CategoryList.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 23/8/2567 BE.
//

import SwiftUI

struct CategoryList: View {
    let dishes : [Dish]
    @State private var selected : String = "abc"
    
    var body: some View {
        VStack{
            Text("ORDER FOR DELIVERY!")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(primary1)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            buildCategories()
                .padding(.bottom, 20)
            
            
            Divider()
                .frame(height: 2)
                .overlay(myGrey)
         
        }
        .padding()
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
        
        let array = Array(categories)
        return ScrollView(.horizontal){
            HStack{
                ForEach(array, id: \.self){item in
                    CategoryItem(label: item, selected: $selected)
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
    static let context = PersistenceController.shared.container.viewContext
    let dish = Dish(context: context)
    
    
    static var previews: some View {
        
        CategoryList(dishes: dishes())
    }
    
    static func dishes() -> [Dish] {
        let dish1 = Dish(context: context)
        dish1.title = "Burger"
        dish1.image = "image"
        dish1.price = "10"
        dish1.category = "Lunch"
        dish1.desc = "Lorem Ispam"
        
        
        let dish2 = Dish(context: context)
        dish2.title = "Burger"
        dish2.image = "image"
        dish2.price = "10"
        dish2.category = "Fast Food"
        dish2.desc = "Lorem Ispam"
        
        return [dish1, dish2]
    }
}
