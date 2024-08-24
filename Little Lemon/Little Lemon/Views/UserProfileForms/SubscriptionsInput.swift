//
//  SubscriptionsInput.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 24/8/2567 BE.
//

import SwiftUI

struct SubscriptionsInput: View {
    
    @Binding var profileData : UserProfileData
    
    var body: some View {
        VStack{
            Text("E-mail Notifications:")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Toggle("Password Change", isOn: $profileData.passwordChangeNotification)
                .toggleStyle(.switch)
            
            Toggle("Order Status", isOn: $profileData.orderStatusNotification)
                .toggleStyle(.switch)
            
            Toggle("Special Offers", isOn: $profileData.specialOfferNotification)
                .toggleStyle(.switch)
            
            Toggle("Newsletter", isOn: $profileData.newsletter)
                .toggleStyle(.switch)
        }
    }
}
