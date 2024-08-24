//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 21/8/2567 BE.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    
    @State private var profileData : UserProfileData = UserProfileData.empty
    @State private var accountName : String = ""
    @State private var isLoggedOut : Bool = false
    
    @State private var showAccountNameError : Bool = false
    @State private var showEmailError : Bool = false
    @State private var showNameError : Bool = false
    
    @State private var showToast : Bool = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    profileImage
                    
                    AccountNameInput(
                        accountName: $accountName,
                        showError: $showAccountNameError,
                        isDisabled: true
                    )
                    
                    ContactInput(
                        firstName: $profileData.firstName,
                        lastName: $profileData.lastName,
                        email: $profileData.email,
                        showEmailError: $showEmailError,
                        showNameError: $showNameError
                    )
                    
                    SubscriptionsInput(profileData: $profileData)
                    
                    actions
                }
                .toast(isShowing: $showToast, message: "Save changes to disk!")
                .padding()
                
            } //</ScrollView>
        } //</NavigationStack>
        .navigationTitle("Personal information")
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                logoutButton
            }
        }
        .navigationDestination(isPresented: $isLoggedOut) {
            Onboarding()
        }
        .onAppear{
            profileData = UserProfileData.load()
            accountName = profileData.accountName
            
            print(accountName)
        }
    }
    
    private var profileImage : some View{
        ZStack(alignment: .bottom)
        {
            Image("profile-image-placeholder")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 140, height: 160)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                HStack{
                    Image(systemName: "pencil")
                    Text("Edit")
                        
                }
                
            })
            .foregroundColor(.white)
            .padding(.vertical, 5)
            .fontWeight(.medium)
            .frame(maxWidth: 140)
            .background(primary1.opacity(0.86))
            .clipShape(
                UnevenRoundedRectangle(
                    bottomLeadingRadius: 16,
                    bottomTrailingRadius: 16
                )
            )
        }
    }
    
    
    private var actions : some View{
        HStack(){
            Spacer()
            
            Button("Discard Changes"){
                profileData = UserProfileData.load()
            }
            .buttonStyle(.bordered)
            .tint(primary1)
            .cornerRadius(30)
            
            Button("Save"){
                showToast = true
                profileData.save()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    showToast = false
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(primary1)
            .cornerRadius(30)
        }
        .padding(.top, 10)
    }
    
    private var logoutButton : some View{
        Button("Logout"){
            UserDefaults.standard.set(false, forKey: kIsLoggedIn)
            isLoggedOut = true
        }
    }
    
}





#Preview {
    UserProfile()
}
