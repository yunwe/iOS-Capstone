//
//  Verification.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 21/8/2567 BE.
//

import Foundation

class Verification{
    
    
    static func isValidEmail(_ email: String) -> Bool {
        // Regular expression for validating an email address
        let emailPattern = "^[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Z]{2,}$"
        
        // Create a regular expression object
        guard let regex = try? NSRegularExpression(pattern: emailPattern, options: .caseInsensitive) else {
            return false
        }
        
        // Check if the email matches the pattern
        let range = NSRange(location: 0, length: email.utf16.count)
        let match = regex.firstMatch(in: email, options: [], range: range)
        
        return match != nil
    }

    
    static func isValidAccountName(_ accountName: String) -> Bool {
        // Define the regular expression pattern
        let pattern = "^[a-zA-Z0-9_.]+$"
        
        // Create a regular expression object
        guard let regex = try? NSRegularExpression(pattern: pattern) else {
            return false
        }
        
        // Check if the account name matches the pattern
        let range = NSRange(location: 0, length: accountName.utf16.count)
        let match = regex.firstMatch(in: accountName, options: [], range: range)
        
        return match != nil
    }

    
    static func isEmpty(_ input: String?) -> Bool{
        if let input = input{
            let res = input.trimmingCharacters(in: .whitespacesAndNewlines)
            return res.isEmpty || res == ""
        }
        
        return true
    }
    
}


