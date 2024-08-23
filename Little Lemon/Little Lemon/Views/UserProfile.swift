//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 21/8/2567 BE.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    @State private var accountName : String = "acco"
    @State private var firstName : String = ""
    @State private var lastName : String = ""
    @State private var email : String = ""
    
    
    var body: some View {
        NavigationView(content: {
            
            ScrollView{
                VStack{
                    
                    HStack(alignment: .bottom){
                        Image("profile-image-placeholder")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 140, height: 140)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        VStack{
                            Button("Change"){
                                
                            }
                            
                            Button("Remove"){
                                
                            }
                        }
                    }
                    
                    
                    LabelTextfield(
                        label: "Account Name",
                        placeholder: "John",
                        isDisabled: true,
                        myText: $accountName
                    )
                    
                    
                    NameInput(firstName: $firstName, lastName: $lastName)
                    
                    LabelTextfield(
                        label: "E-mail",
                        placeholder: "johndoe@abc.com",
                        isDisabled: false,
                        myText: $email
                    )
                    
                    
                    
                    HStack{
                        Button("Discard Changes"){
                            
                        }
                        .buttonStyle(.bordered)
                        .tint(primary1)
                        .cornerRadius(30)
                        
                        Button("Save"){
                            
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(primary1)
                        .cornerRadius(30)
                        
                    }
                    
                    Rectangle()
                        .fill(.clear)
                        .frame(height: 10)
                        
                    Divider()
                        .frame(height: 1)
                        .overlay(primary1)
                    
                    
                    Button(action: {
                        
                        UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                        
                        //it will automatically tell the NavigationView
                        //to go back to the previous screen
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Text("Logout")
                            .bold()
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                    }
                    .foregroundColor(primary1)
                    .background(primary2)
                    .cornerRadius(30)
                    .padding(.top, 10)
                    
                    
                    
                    
                   
                }
                .padding()
                
            }
        })
        .navigationTitle("Personal information")
        .onAppear{
            
        }
    }
}





#Preview {
    UserProfile()
}
