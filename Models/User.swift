//
//  User.swift
//  NIBM COVID19
//
//  Created by chamod Nimsara on 9/13/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import CoreLocation

enum AccountType: Int {
    case student
    case lecturer
}

struct User {
    let fullName: String
    let email: String
    var accountType: AccountType!
    var location: CLLocation?
    let uid: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        
        if let index = dictionary["accountType"] as? Int {
            self.accountType = AccountType(rawValue: index)
        }
    }
}
