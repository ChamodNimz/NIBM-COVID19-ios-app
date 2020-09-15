//
//  ProfileViewExtension.swift
//  NIBM COVID19
//
//  Created by chamod Nimsara on 9/15/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import Foundation
import UIKit
import Firebase

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func handleRegister() {
        
                guard
                    let email = emailTextField.text,
                    let country = countryText.text,
                    let name = nameTextField.text else {
                    
                        print("form error ...")
                        let alert: UIAlertController = {
                            return UIAlertController().showErrorAlert(message: "All fields must be filled !")
                        }()
                        self.present(alert, animated: true)
                        
                    return
                }
       
        
        guard let uid = Service.shared.currentUid else {
                        return
                    }
        
                    //successfully authenticated user
                    let imageName = NSUUID().uuidString
                    let storageRef = Storage.storage().reference().child("profile_images").child("\(imageName).png")
        
                    if let uploadData = self.profileImageView.image!.pngData() {
        
                        storageRef.putData(uploadData, metadata: nil, completion: { (_, err) in
        
                            if let error = err {
                                print(error)
                                return
                            }
        
                            storageRef.downloadURL(completion: { (url, err) in
                                if let err = err {
                                    print(err)
                                    return
                                }
        
                                guard let url = url else { return }
                                let values = ["name": name, "email": email, "profileImageUrl": url.absoluteString, "country":country]
        
                                self.registerUserIntoDatabaseWithUID(uid, values: values as [String : AnyObject])
                            })
        
                        })
                    }
                
    }
    
    fileprivate func registerUserIntoDatabaseWithUID(_ uid: String, values: [String: AnyObject]) {
        
        Service.shared.updateUserProfileWithImage(imageUrl:values["profileImageUrl"] as! String, username: values["name"] as! String, email: values["email"] as! String, country: values["country"] as! String)
    }
    
    @objc func handleSelectProfileImageView() {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
        
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            profileImageView.image = selectedImage
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("canceled picker")
        dismiss(animated: true, completion: nil)
    }
    
}

fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}
