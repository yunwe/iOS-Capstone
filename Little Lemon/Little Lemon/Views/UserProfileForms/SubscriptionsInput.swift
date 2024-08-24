//
//  SubscriptionsInput.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 24/8/2567 BE.
//

import SwiftUI

struct SubscriptionsInput: View {
    
    @Binding var profile : UserProfileData
    
    var body: some View {
        VStack{
            Text("E-mail Notifications:")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Toggle("Password Change", isOn: $profile.passwordChangeNotification)
                .toggleStyle(.switch)
            
            Toggle("Order Status", isOn: $profile.orderStatusNotification)
                .toggleStyle(.switch)
            
            Toggle("Special Offers", isOn: $profile.specialOfferNotification)
                .toggleStyle(.switch)
            
            Toggle("Newsletter", isOn: $profile.newsletter)
                .toggleStyle(.switch)
        }
    }
}
