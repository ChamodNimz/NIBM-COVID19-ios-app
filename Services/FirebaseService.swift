//
//  FirebaseService.swift
//  NIBM COVID19
//
//  Created by chamod Nimsara on 9/11/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import Foundation
import Firebase

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
let REF_SURVEYS = DB_REF.child("surveys")

// MARK: - SharedService

struct Service {
    
    static let shared = Service()
    let currentUid = Auth.auth().currentUser?.uid
    
    
    // MARK: Users section
    func fetchUserData() {
        REF_USERS.child(currentUid!).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            let uid = snapshot.key
        }
    }
    
    
    // MARK: Survey section
    
    func createSurvey(question: String, value: Int){
        
        return REF_SURVEYS.child("\(currentUid)/\(question)").setValue(value)
    }
}
