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
    
    @State private var showAccountNameError : Bool = false
    @State private var showEmailError : Bool = false
    @State private var showNameError : Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                Hero()

                if(pageIndex == 0)
                {
                    AccountNameInput(
                        accountName: $accountName,
                        showError: $showAccountNameError,
                        isDisabled: false
                    )
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
                    SubscriptionsInput(profileData: $profileData)
                        .padding()
                    
                    registerButton
                }
                Spacer()
                footer
            }
            .navigationDestination(isPresented: $isLoggedIn) {
                Home()
            }
        }
        .navigationBarBackButtonHidden(true)

        .onAppear(){
            isLoggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn)
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
                next()
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
    
    private func next() {
        showAccountNameError = false
        showEmailError = false
        showNameError = false
        
        if pageIndex == 0{
            if !Verification.isValidAccountName(accountName){
                showAccountNameError = true
                return
            }
        }
        
        if pageIndex == 1{
            if Verification.isEmpty(profileData.firstName) ||
                Verification.isEmpty(profileData.lastName){
                showNameError = true
            }
            if !Verification.isValidEmail(profileData.email){
                print(profileData.email)
                showEmailError = true
            }
            if showNameError || showEmailError{
                return
            }
        }
        
        if Verification.isEmpty(profileData.accountName){
            profileData = UserProfileData(accountName: accountName.lowercased())
        }
        
        let newIndex = pageIndex + 1
        pageIndex = newIndex < MAX_PAGES ? newIndex : MAX_PAGES - 1
        
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
        profileData.save()
        
        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
        isLoggedIn = true
    }
    
}


#Preview {
    Onboarding()
}
