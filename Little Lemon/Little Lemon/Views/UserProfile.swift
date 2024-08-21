//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 21/8/2567 BE.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack{
            Text("Personal information")
            Image("profile-image-placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
                .clipped()  
                
                
            Text(UserDefaults.standard.string(forKey: kFirstName) ?? "")
            Text(UserDefaults.standard.string(forKey: kLastName) ?? "")
            Text(UserDefaults.standard.string(forKey: kEmail) ?? "")
            Button("Logout"){
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                
                //it will automatically tell the NavigationView
                //to go back to the previous screen
                self.presentation.wrappedValue.dismiss()
            }
            Spacer()
        }
    }
}

#Preview {
    UserProfile()
}
