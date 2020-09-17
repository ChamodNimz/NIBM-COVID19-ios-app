//
//  ProfileViewController.swift
//  NIBM COVID19
//
//  Created by chamod Nimsara on 9/8/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    let loader = Loader()
    
    // MARK: - Lifecycale
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jon Snow"
        label.font = UIFont(name: "Avenir" , size: 45)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userTemp: UILabel = {
        let label = UILabel()
        label.text = "00.0 Cº"
        label.font = UIFont(name: "Avenir-Light" , size: 25)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userDataContainer: UIView = {
        
        let view = UIView()
        //view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private let loginRegisterButton: AuthButtonUIButton = {
        
        let button = AuthButtonUIButton(type: .system)
        button.setTitle("Update", for: UIControl.State())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleUpdate), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func handleUpdate() {
        
        handleOnClickUpdate()
    }
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Name"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let nameSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let emailSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let countryText: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Country"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "91e4521cc6ed2e094e0f02ee8ddbe68e-flat-camera-circle-icon-by-vexels")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImageView)))
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    
    func setupProfileImageView() {
        
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    var inputsContainerViewHeightAnchor: NSLayoutConstraint?
    var nameTextFieldHeightAnchor: NSLayoutConstraint?
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    
    func setupInputsContainerView() {
        
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 150)
        inputsContainerViewHeightAnchor?.isActive = true
        inputsContainerView.topAnchor.constraint(equalTo: userDataContainer.bottomAnchor).isActive = true
        
        inputsContainerView.addSubview(nameTextField)
        inputsContainerView.addSubview(nameSeparatorView)
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(emailSeparatorView)
        inputsContainerView.addSubview(countryText)
        
        //need x, y, width, height constraints
        nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        nameTextFieldHeightAnchor?.isActive = true
        
        //need x, y, width, height constraints
        nameSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        nameSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //need x, y, width, height constraints
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        
        emailTextFieldHeightAnchor?.isActive = true
        
        //need x, y, width, height constraints
        emailSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        emailSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //need x, y, width, height constraints
        countryText.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        countryText.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        
        countryText.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordTextFieldHeightAnchor = countryText.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        passwordTextFieldHeightAnchor?.isActive = true
    }
    
    func setupLoginRegisterButton() {
        //need x, y, width, height constraints
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
        Service.shared.fetchUserData(uid: Service.shared.currentUid ?? ""){(user)in
            self.usernameLabel.text = user.fullName
            self.userTemp.text = user.temparature + " Cº"
            self.setImageForProfileView(from: URL(string: user.profileImageUrl)!)
        }
        
    }
    
    func getImageFromFireBase(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func setImageForProfileView(from url: URL) {
        
        getImageFromFireBase(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
  
            DispatchQueue.main.async() { [weak self] in
                self?.profileImageView.image = UIImage(data: data)
                self?.profileImageView.layer.cornerRadius = 50
            }
        }
    }
    
    //MARK: Methods
    
    func configureUI(){
        
        view.backgroundColor = .black
        title = "Profile"
        
        view.backgroundColor = .black
        
        view.addSubview(inputsContainerView)
        view.addSubview(loginRegisterButton)
        view.addSubview(profileImageView)
        //view.addSubview(loginRegisterSegmentedControl)
        view.addSubview(userDataContainer)
        view.addSubview(usernameLabel)
        usernameLabel.text = Service.shared.username
        
        setupInputsContainerView()
        setupLoginRegisterButton()
        setupProfileImageView()
        setupUserDataContainer()
        
    }
    
    func setupUserDataContainer(){
        
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            usernameLabel.bottomAnchor.constraint(equalTo: profileImageView.topAnchor, constant: -35),
            usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 80)])
        
        NSLayoutConstraint.activate([
            userDataContainer.topAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            userDataContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            userDataContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            userDataContainer.heightAnchor.constraint(equalToConstant: 130)])
        
        
        
        userDataContainer.addSubview(userTemp)
        NSLayoutConstraint.activate([
            userTemp.centerXAnchor.constraint(equalTo: userDataContainer.centerXAnchor),
            userTemp.centerYAnchor.constraint(equalTo: userDataContainer.centerYAnchor)])
        
    }
    
    func handleOnClickUpdate() {
        
        guard let email = emailTextField.text else {
            return
        }
        guard let country = countryText.text else {
            return
        }
        guard let name = nameTextField.text else {
            return
        }
        
        if(!email.isEmpty && !country.isEmpty && !name.isEmpty){
            
            guard let uid = Service.shared.currentUid else {
                return
            }
            
            //successfully authenticated user
            let imageName = NSUUID().uuidString
            let storageRef = Storage.storage().reference().child("profile_images").child("\(imageName).png")
            
            loader.showUniversalLoadingView(true)
            
            if let uploadData = self.profileImageView.image!.pngData() {
                
                storageRef.putData(uploadData, metadata: nil, completion: { (_, err) in
                    
                    if let error = err {
                        print(error)
                        
                        let alert: UIAlertController = {
                            return UIAlertController().showErrorAlert(message: error.localizedDescription)
                        }()
                        self.present(alert, animated: true)
                        return
                    }
                    
                    storageRef.downloadURL(completion: { (url, err) in
                        if let err = err {
                            print(err)
                            
                            let alert: UIAlertController = {
                                return UIAlertController().showErrorAlert(message: err.localizedDescription)
                            }()
                            self.present(alert, animated: true)
                            return
                        }
                        
                        guard let url = url else { return }
                        let values = ["name": name, "email": email, "profileImageUrl": url.absoluteString, "country":country]
                        
                        self.registerUserIntoDatabaseWithUID(uid, values: values as [String : AnyObject])
                    })
                    
                })
            }
        }else{
            let alert: UIAlertController = {
                return UIAlertController().showErrorAlert(message: "Please enter all details !")
            }()
            self.present(alert, animated: true)
        }
        
    }
    
    fileprivate func registerUserIntoDatabaseWithUID(_ uid: String, values: [String: AnyObject]) {
        
        Service.shared.updateUserProfileWithImage(imageUrl:values["profileImageUrl"] as! String, username: values["name"] as! String, email: values["email"] as! String, country: values["country"] as! String)
        
        loader.showUniversalLoadingView(false)
        
        Service.shared.fetchUserData(uid: Service.shared.currentUid ?? ""){(user)in
            self.usernameLabel.text = user.fullName
        }
        
        let alert: UIAlertController = {
            return UIAlertController().showSuccessAlert(message: "Successfully updated information!")
        }()
        self.present(alert, animated: true)
    }
    
    
    
}
