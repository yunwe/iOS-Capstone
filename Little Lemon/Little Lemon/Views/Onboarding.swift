//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 21/8/2567 BE.
//


import SwiftUI


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
            .navigationBarBackButtonHidden(true)
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
//        
//        UserDefaults.standard.set(firstName, forKey: kFirstName)
//        UserDefaults.standard.set(lastName, forKey: kLastName)
//        UserDefaults.standard.set(email, forKey: kEmail)
//        
        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
        isLoggedIn = true
    }
    
    
}

#Preview {
    Onboarding()
}
