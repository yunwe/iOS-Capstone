//
//  UserProfileData.swift
//  Little Lemon
//
//  Created by Saw Yu Nwe on 23/8/2567 BE.
//

import Foundation

let kAccountName : String = "KEY_ACCOUNT_NAME"
let kFirstName : String = "xmJlkdwn@first_name_key"
let kLastName : String = "kKw0En9x@last_name_key"
let kEmail : String = "lK2e9xw@mail_key"
let kOrderStatus : String = "KEY_ORDER_STATUS_NOTI"
let kPWChange : String = "KEY_PASSWORD_CHANGE_NOTI"
let kSpecialOffer : String = "KEY_SPECIAL_OFFER_NOTI"
let kNewsletter : String = "KEY_NEWSLETTER"

let kIsLoggedIn : String = "KEY_IS_LOG_IN"


class UserProfileData {
    let accountName : String
    
    var firstName : String = ""
    var lastName : String = ""
    var email : String = ""
    
    var orderStatusNotification : Bool = true
    var passwordChangeNotification : Bool = true
    var specialOfferNotification : Bool = true
    var newsletter : Bool = true
    
    init(accountName: String) {
        self.accountName = accountName
    }
    
    static var empty : UserProfileData {
         UserProfileData(accountName: "empty")
    }
    
    static func load() -> UserProfileData {
        let profileData = UserProfileData(accountName: UserDefaults.standard.string(forKey: kAccountName) ?? "")
        profileData.firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
        profileData.lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
        profileData.email = UserDefaults.standard.string(forKey: kEmail) ?? ""
        profileData.orderStatusNotification = UserDefaults.standard.bool(forKey: kOrderStatus)
        profileData.passwordChangeNotification = UserDefaults.standard.bool(forKey: kPWChange)
        profileData.specialOfferNotification = UserDefaults.standard.bool(forKey: kSpecialOffer)
        profileData.newsletter = UserDefaults.standard.bool(forKey: kNewsletter)
        
        return profileData
    }
    
    func save() {
        UserDefaults.standard.set(firstName, forKey: kFirstName)
        UserDefaults.standard.set(lastName, forKey: kLastName)
        UserDefaults.standard.set(email, forKey: kEmail)
        UserDefaults.standard.set(orderStatusNotification, forKey: kOrderStatus)
        UserDefaults.standard.set(passwordChangeNotification, forKey: kPWChange)
        UserDefaults.standard.set(specialOfferNotification, forKey: kSpecialOffer)
        UserDefaults.standard.set(newsletter, forKey: kNewsletter)
    }
}
