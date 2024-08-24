//
//  AccountNameInput.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 24/8/2567 BE.
//

import SwiftUI

struct AccountNameInput: View {
    
    @Binding var accountName : String
    @Binding var showError : Bool
    
    let isDisabled : Bool
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Account Name:")
                .font(.headline)
            
            TextField("Account Name", text: $accountName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disabled(isDisabled)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            
            if showError{
                Text("""
                    Account name can only include letters, numbers, periods (.), and hyphens (-).
                    No spaces or other special characters allowed.
                    """)
                    .font(.callout)
                    .foregroundStyle(.red)
            }
        }
    }
}
