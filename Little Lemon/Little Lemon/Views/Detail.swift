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
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading){
                    //image
                    if let imagePath = dish.image {
                        AsyncImage(url: URL(string: imagePath)){image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 250)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }placeholder: {
                            ProgressView()
                        }
                    }
                    else{
                        Color(.black)
                            .frame(width: .infinity, height: 250)
                    }//End of image
                    
                    HStack{
                        Text(dish.title ?? "")
                            .font(.title2)
                        Spacer()
                        Text(dish.price ?? "")
                            .font(.callout)
                            .monospaced()
                    }
                    .fontWeight(.medium)
                    Text("Category : \(dish.category ?? "")")
                    
                    Text(dish.desc ?? "")
                }
                .foregroundStyle(.black)
            }
            .padding()
            
        }
        .toolbar{
            ToolbarItem(placement: .principal){
                Text("Little Lemon")
                    .font(.title)
                    .foregroundStyle(.clear)
                    .overlay{
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("Little Lemon")
                    .padding(.bottom)
                
            }
        }
        .toolbarBackground(myGrey, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        
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
        dish.desc =  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        
        return dish
    }
}
