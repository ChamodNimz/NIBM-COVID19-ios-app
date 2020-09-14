//
//  FirebaseService.swift
//  NIBM COVID19
//
//  Created by chamod Nimsara on 9/11/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import Foundation
import Firebase
import CoreLocation
import GeoFire

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
let REF_SURVEYS = DB_REF.child("surveys")
let REF_USER_LOCATIONS = DB_REF.child("user_locations")
let REF_TRIPS = DB_REF.child("trips")

struct Service {
    
    static let shared = Service()
    let currentUid = Auth.auth().currentUser?.uid
    
    // MARK: Survey section
    
    func createSurvey(question: String, value: Int){
        
        return REF_USERS.child(currentUid ?? "").updateChildValues([question:value])
        //return REF_SURVEYS.child("\(currentUid)/\(question)").setValue(value)
    }
    
    // MARK: Map section
    
    func fetchUserData(uid: String, completion: @escaping(User) -> Void) {
        REF_USERS.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            let uid = snapshot.key
            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
        }
    }
    
    //    func fetchUsersLocation(location: CLLocation, completion: @escaping(User) -> Void) {
    //        let geoFire = GeoFire(firebaseRef: REF_USER_LOCATIONS)
    //
    //        REF_USER_LOCATIONS.observe(.value) { (snapshot) in
    //            geoFire.query(at: location, withRadius: 50).observe(.keyEntered, with: { (uid, location) in
    //                self.fetchUserData(uid: uid) { (user) in
    //                    var user = user
    //                    user.location = location
    //                    completion(user)
    //                }
    //            })
    //        }
    //    }
    
    func fetchUsersLocation(location: CLLocation, completion: @escaping(User) -> Void) {
        let geoFire = GeoFire(firebaseRef: REF_USER_LOCATIONS)
        
        REF_USER_LOCATIONS.observe(.value) { (snapshot) in
            geoFire.query(at: location, withRadius: 50).observe(.keyEntered, with: { (uid, location) in
                self.fetchUserData(uid: uid) { (user) in
                    var usr = user
                    usr.location = location
                    completion(usr)
                }
            })
        }
    }
    
    // MARK: Update temparature section
    func updateTemp(value: String){
        
        return REF_USERS.child(currentUid ?? "").updateChildValues(["temparature":value])
    }
    
    func readTempValue(){
        
        REF_USERS.child(currentUid!).observeSingleEvent(of: .value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            value?["temparature"] as! NSString
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
}
