//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 21/8/2567 BE.
//


import SwiftUI


struct Onboarding: View {
    
    private let MAX_PAGES = 3
    
    @State private var accountName : String = ""
    @State var profileData : UserProfileData = UserProfileData.empty
    
    
    @State var isLoggedIn : Bool = false
    @State var pageIndex : Int = 0
    
    
    @State private var showEmailError : Bool = false
    @State private var showNameError : Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                Hero()

                if(pageIndex == 0)
                {
                    AccountNameInput(accountName: $accountName, isDisabled: false)
                        .padding()

                }
                else if(pageIndex == 1)
                {
                    ContactInput(
                        firstName: $profileData.firstName,
                        lastName: $profileData.lastName,
                        email: $profileData.email,
                        showEmailError: $showEmailError,
                        showNameError: $showNameError
                    )
                    .padding()
                }
                else{
                    SubscriptionsInput(profile: $profileData)
                        .padding()
                    
                    registerButton
                }
                Spacer()
                footer
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $isLoggedIn) {
            Home()
        }
        .onAppear(){
            isLoggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn)
        }
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
        }
        
    }
    
    
    private var footer : some View{
        HStack{
            Button(action: {
                let newIndex = pageIndex - 1
                pageIndex = newIndex > 0 ? newIndex : 0
                
            }) {
                
                Image(systemName: "arrow.backward")
                    
            }
            .foregroundColor(primary2)
            .frame(width: 32, height: 32)
            .background(primary1)
            .clipShape(Circle())
            
            Spacer()
            
            Text("\(pageIndex+1)/3")
                .padding(.horizontal)
                .padding(.vertical, 5)
                .foregroundColor(primary2)
                .background(primary1)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Spacer()
            
            Button(action: {
                let newIndex = pageIndex + 1
                pageIndex = newIndex < MAX_PAGES ? newIndex : MAX_PAGES - 1
                
            }) {
                
                Image(systemName: "arrow.forward")
                    
            }
            .foregroundColor(primary2)
            .frame(width: 32, height: 32)
            .background(primary1)
            .clipShape(Circle())
        }
        .padding()
    }
    
    private var registerButton : some View{
        Button(action: {
            register()
        }) {
            Text("Register")
                .bold()
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
        }
        .foregroundColor(primary1)
        .background(primary2)
        .cornerRadius(30)
        .padding(.top, 10)
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
