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
    let qOne: Int
    let qtwo: Int
    let qThree: Int
    let qFour: Int
    let temparature: String
    let profileImageUrl: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.qOne = dictionary["qOne"] as? Int ?? 0
        self.qtwo = dictionary["qTwo"] as? Int ?? 0
        self.qThree = dictionary["qThree"] as? Int ?? 0
        self.qFour = dictionary["qFour"] as? Int ?? 0
        self.temparature = dictionary["temparature"] as? String ?? "0.0"
        self.profileImageUrl = dictionary["image"] as? String ?? ""
        
        
        if let index = dictionary["accountType"] as? Int {
            self.accountType = AccountType(rawValue: index)
        }
    }
}
