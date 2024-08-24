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
        VStack(alignment: .leading, spacing: 10) {
            Text("Full Name:")
                .font(.headline)
            
            HStack{
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
            }
            if showNameError{
                Text("Name cannot be empty.")
                    .font(.callout)
                    .foregroundStyle(.red)
            }
        
            Text("E-mail:")
                .font(.headline)
            
            TextField("E-mail", text: $email)
                
                .textInputAutocapitalization(.never)
            
            if showEmailError{
                Text("Invalid E-mail format.")
                    .font(.callout)
                    .foregroundStyle(.red)
            }
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .autocorrectionDisabled()
    }
}

