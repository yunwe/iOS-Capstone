//
//  Hero.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 22/8/2567 BE.
//

import SwiftUI

struct Hero: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Little Lemon")
                .font(.system(size: 52, weight: .medium, design: .serif))
                .foregroundStyle(primary2)
            Text("Chicago")
                .font(.system(size: 32, weight: .medium, design: .serif))
                .foregroundStyle(myGrey)
            HStack{
                Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                    .foregroundStyle(.white)
                    .frame(width: 230)
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    
                Image("HeroImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 140)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 25)
                    )
            }
//            Button(action: { }) {
//                Text("Reserve a Table")
//                    .bold()
//                    .padding(.horizontal, 20)
//                    .padding(.vertical, 10)
//            }
//            .foregroundColor(primary1)
//            .background(primary2)
//            .cornerRadius(30)
            
        }
        .padding()
        .background(primary1)
    }
}

#Preview {
    Hero()
}
