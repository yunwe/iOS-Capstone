//
//  Detail.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 22/8/2567 BE.
//

import SwiftUI

struct Detail: View {
    let dish : Dish
    
    var body: some View {
        VStack{
            Text(dish.title ?? "")
        }
    }
}


struct DisplayDish_Previews: PreviewProvider {
    static let context = PersistenceController.shared.container.viewContext
    let dish = Dish(context: context)
    static var previews: some View {
        Detail(dish: oneDish())
    }
    
    static func oneDish() -> Dish {
        let dish = Dish(context: context)
        dish.title = "Burger"
        dish.image = "image"
        dish.price = "10"
        dish.category = "Fast Food"
        dish.desc = "Lorem Ispam"
        
        return dish
    }
}
