//
//  AccountNameInput.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 24/8/2567 BE.
//

import SwiftUI

struct AccountNameInput: View {
    
    @Binding var accountName : String
    
    let isDisabled : Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
                    Text("Account Name:")
                        .font(.headline)
                    
                TextField("Account Name", text: $accountName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .disabled(isDisabled)
                        .autocorrectionDisabled()
                        
                }

    }
}
