//
//  HomeScreenViewController.swift
//  NIBM COVID19
//
//  Created by chamod Nimsara on 9/6/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import Firebase

class HomeScreenViewController: UIViewController {
    
    // MARK: - Properties
    private let buttonHome: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Home", for: .normal)
        button.tintColor = .orange
        button.setImage(#imageLiteral(resourceName: "home (3)"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.alignImageAndTitleVertically()
        return button
    }()
    
    private let buttonUpdate: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Update", for: .normal)
        button.tintColor = .orange
        button.setImage(#imageLiteral(resourceName: "plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.alignImageAndTitleVertically()
        button.addTarget(self, action: #selector(handleOnClickUpdate), for: .touchUpInside)
        return button
    }()
    
    private let buttonSettings: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Settings", for: .normal)
        button.tintColor = .orange
        button.setImage(#imageLiteral(resourceName: "settings (2)"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.alignImageAndTitleVertically()
        return button
    }()
    
    
    // MARK: - Lifecycale
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        checkIsUserLoggedIn()
        configureUI()
        
    }
    
    //MARK: Methods
    
    func configureUI(){
        
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .black
        settupBottoNavBar()
        
    }
    
    func settupBottoNavBar(){
        
        let bottomNavigationStackView = UIStackView(arrangedSubviews: [buttonHome, buttonUpdate, buttonSettings])
        view.addSubview(bottomNavigationStackView)
        
        NSLayoutConstraint.activate([
            bottomNavigationStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomNavigationStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomNavigationStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomNavigationStackView.heightAnchor.constraint(equalToConstant: 50)])
        
        bottomNavigationStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomNavigationStackView.distribution = .fillEqually
        
    }
    
    @objc func handleOnClickUpdate(){
        
        let nav = UINavigationController(rootViewController: QuestionOneViewController())
        present(nav, animated: true, completion: nil)
    }
    
    //MARK: API
    
    func checkIsUserLoggedIn() {
        if(Auth.auth().currentUser?.uid == nil) {
            
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginViewController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: sign out error")
        }
    }
}
