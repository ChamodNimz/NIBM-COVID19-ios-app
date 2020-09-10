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
        button.addTarget(self, action: #selector(handleOnClickSettings), for: .touchUpInside)
        button.alignImageAndTitleVertically()
        return button
    }()
    
    // MARK: Content Properties
    private let buttonSafeActions: UIButton = {
        
        let button = UIButton(type: .system).createButtonWithRightForwardIcon()
        button.setTitle("Safe actions", for: .normal )
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.tintColor = .orange
        return button
    }()
    
    
    
    
    // MARK: - Lifecycale
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        checkIsUserLoggedIn()
        configureUI()
        view.addSubview(buttonSafeActions)
        NSLayoutConstraint.activate([
        buttonSafeActions.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 30),
        buttonSafeActions.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        buttonSafeActions.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        buttonSafeActions.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    //MARK: Methods
    
    func configureUI(){
        
        title = "Home"
        settupBottomNavBar()
        
    }
    
    func settupBottomNavBar(){
        
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
    
    //MARK: Events
    
    @objc func handleOnClickUpdate(){
        
        let vc = UpdateViewController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleOnClickSettings(){
        
        let vc = SettingsViewController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleOnClickHome(){
        
        let vc = UpdateViewController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
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

}
