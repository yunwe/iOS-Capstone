//
//  Verification.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 21/8/2567 BE.
//

import Foundation

class Verification{
    // Regular expression pattern for validating email addresses
    static let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Z]{2,}$"

    // Create a regular expression instance
    static let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    
    static func isValidEmail(_ email: String) -> Bool{
        return emailPredicate.evaluate(with: email)
    }

    
    static func isEmpty(_ input: String) -> Bool{
        let input = input.trimmingCharacters(in: .whitespacesAndNewlines)
        return input.isEmpty || input == ""
    }
    
}
