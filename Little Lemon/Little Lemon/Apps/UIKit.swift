//
//  UIKit.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 22/8/2567 BE.
//

import SwiftUI

let primary1 = Color(red: 0.2863, green: 0.3686, blue: 0.3412)
let primary2 = Color(red: 0.9569, green: 0.8078, blue: 0.0784)
let myGrey = Color(red: 0.9294, green: 0.9372, blue: 0.9333)

struct SearchFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.title3)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(myGrey) // Optional: background color for better visibility
            .cornerRadius(8) // Rounded corners

    }
}


struct CustomTextFieldStyle: TextFieldStyle {
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

