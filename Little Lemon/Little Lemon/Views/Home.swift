//
//  Home.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 21/8/2567 BE.
//

import SwiftUI

struct Home: View {
    
    
    var body: some View {
        TabView{
            Menu()
                .tag(0)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            UserProfile()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
                
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
