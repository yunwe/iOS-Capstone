//
//  ContactInput.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 24/8/2567 BE.
//

import SwiftUI

struct ContactInput: View {
    
    @Binding var firstName : String
    @Binding var lastName : String
    @Binding var email : String
    
    @Binding var showEmailError : Bool
    @Binding var showNameError : Bool
    
    
    var body: some View {
        NameInput(
            firstName: $firstName,
            lastName: $lastName
        )
        
        VStack(alignment: .leading, spacing: 10) {
            Text("E-mail:")
                .font(.headline)
            
            TextField("johndoe@abc.com", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocorrectionDisabled()
            
            if showEmailError{
                Text("Invalid E-mail format.")
                    .font(.callout)
                    .foregroundStyle(.red)
            }
        }
    }
}

