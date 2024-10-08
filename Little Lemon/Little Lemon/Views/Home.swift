//
//  Home.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 21/8/2567 BE.
//

import SwiftUI

struct Home: View {
    let persistence = PersistenceController.shared
    
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    Hero()
                    Menu()
                        .environment(\.managedObjectContext, persistence.container.viewContext)
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
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
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    UserProfile()
                } label: {
                    Image("profile-image-placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32, height: 32)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .padding(.bottom)
                    
                }
            }
        }
        .toolbarBackground(myGrey, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
        
}

#Preview {
    Home()
}
