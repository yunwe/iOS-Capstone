//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 21/8/2567 BE.
//

let kFirstName : String = "xmJlkdwn@first_name_key"
let kLastName : String = "kKw0En9x@last_name_key"
let kEmail : String = "lK2e9xw@mail_key"
let kIsLoggedIn : String = "KEY_IS_LOG_IN"

import SwiftUI

private struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(Color.white) // Optional: background color for better visibility
            .cornerRadius(8) // Rounded corners
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 2) // Border color and width
            )
    }
}

struct Onboarding: View {
    @State var firstName : String = ""
    @State var lastName : String = ""
    @State var email : String = ""
    
    @State var isLoggedIn : Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                TextField("First Name", text: $firstName)
                    .textFieldStyle(CustomTextFieldStyle())
                               
                TextField("Last Name", text: $lastName)
                    .textFieldStyle(CustomTextFieldStyle())
                TextField("E-mail", text: $email)
                    .textFieldStyle(CustomTextFieldStyle())
                HStack{
                    Spacer()
                    Button("Register"){
                        register()
                    }
                }
                
            }
            .padding()
            .navigationDestination(isPresented: $isLoggedIn) {
                Home()
            }
            .onAppear(){
                isLoggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn)
                
            }
            
        }

        
        
    }
    
    private func register(){
//        if(Verification.isEmpty(firstName)
//           || Verification.isEmpty(lastName)
//           || Verification.isValidEmail(email)
//        ){
//            print("Invalid")
//            return
//        }
//        UserDefaults.standard.set(firstName, forKey: kFirstName)
//        UserDefaults.standard.set(lastName, forKey: kLastName)
//        UserDefaults.standard.set(email, forKey: kEmail)
//        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
        
        isLoggedIn = true
        
        print("isLoggedIn")
    }
    
    
}

#Preview {
    Onboarding()
}
