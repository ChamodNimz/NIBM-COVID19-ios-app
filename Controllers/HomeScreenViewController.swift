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
    
    private let stayHomeContainer = UIView()
    private let stayHomeControlsContainer = UIView()
    private let notificationsBarContainer = UIView()
    private let universityCaseUpdatesContainer = UIView()
    private let mapViewContainer = UIView()
    private let seeMore = UIView()
    
    let buttonNotifications: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("NIBM is closed until further notice!", for: .normal)
        button.setImage(#imageLiteral(resourceName: "forward"), for: .normal)
        button.tintColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.semanticContentAttribute = .forceRightToLeft
        //button.addTarget(self, action: #selector(handleOnClickNo), for: .touchUpInside)
        return button
    }()
    
    let buttonSeeMore: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("See more", for: .normal)
        button.tintColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //button.addTarget(self, action: #selector(handleOnClickNo), for: .touchUpInside)
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
        createStayHomeComponent()
        createNotificationsBar()
        createSeeMoreContainer()
        createUniversityCaseUpdateContainer()
        createMapViewContainer()
        
    }
    
    // MARK: Home component
    func createStayHomeComponent(){
        
        stayHomeContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stayHomeContainer)
        
        NSLayoutConstraint.activate([
            stayHomeContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stayHomeContainer.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 2),
            stayHomeContainer.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.5),
            stayHomeContainer.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.2)
            
        ])
        
        stayHomeControlsContainer.translatesAutoresizingMaskIntoConstraints = false
        //stayHomeControlsContainer.backgroundColor = .orange
        view.addSubview(stayHomeControlsContainer)
        
        NSLayoutConstraint.activate([
            stayHomeControlsContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stayHomeControlsContainer.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 5),
            stayHomeControlsContainer.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.5),
            stayHomeControlsContainer.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.2)
        ])
        
        let homeImage = UIImageView(image: #imageLiteral(resourceName: "Untitled design (4)"))
        homeImage.translatesAutoresizingMaskIntoConstraints = false
        stayHomeContainer.addSubview(homeImage)
        NSLayoutConstraint.activate([
            homeImage.topAnchor.constraint(equalTo: stayHomeContainer.topAnchor),
            homeImage.trailingAnchor.constraint(equalTo: stayHomeContainer.trailingAnchor),
            homeImage.widthAnchor.constraint(equalTo: stayHomeContainer.widthAnchor),
            homeImage.heightAnchor.constraint(equalTo: stayHomeContainer.heightAnchor)
        ])
        
        let textOne: UITextView = {
            
            let textView = UITextView()
            textView.text = "All you need to do is"
            textView.textColor = .orange
            textView.textAlignment = .left
            textView.isEditable = false
            textView.isScrollEnabled = false
            textView.font = UIFont.boldSystemFont(ofSize: 17)
            textView.backgroundColor = .black
            textView.translatesAutoresizingMaskIntoConstraints = false
            
            return textView
        }()
        let textTwo: UITextView = {
            
            let textView = UITextView()
            textView.text = "Stay at home!"
            textView.textColor = .orange
            textView.font = UIFont.boldSystemFont(ofSize: 25)
            textView.textAlignment = .left
            textView.isEditable = false
            textView.isScrollEnabled = false
            textView.backgroundColor = .black
            textView.translatesAutoresizingMaskIntoConstraints = false
            
            return textView
        }()
        
        let buttonSafeActions: UIButton = {
            
            let button = UIButton(type: .system)
            button.setTitle("Safe actions", for: .normal)
            button.setImage(#imageLiteral(resourceName: "forward"), for: .normal)
            button.tintColor = .orange
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.semanticContentAttribute = .forceRightToLeft
            //button.addTarget(self, action: #selector(handleOnClickNo), for: .touchUpInside)
            return button
        }()
        stayHomeControlsContainer.addSubview(textOne)
        NSLayoutConstraint.activate([
            textOne.topAnchor.constraint(equalTo: stayHomeControlsContainer.topAnchor),
            textOne.leadingAnchor.constraint(equalTo: stayHomeControlsContainer.leadingAnchor),
            textOne.widthAnchor.constraint(equalTo: stayHomeControlsContainer.widthAnchor)
        ])
        stayHomeControlsContainer.addSubview(textTwo)
        NSLayoutConstraint.activate([
            textTwo.topAnchor.constraint(equalTo: textOne.bottomAnchor),
            textTwo.leadingAnchor.constraint(equalTo: stayHomeControlsContainer.leadingAnchor),
            textTwo.widthAnchor.constraint(equalTo: stayHomeControlsContainer.widthAnchor)
        ])
        stayHomeControlsContainer.addSubview(buttonSafeActions)
        NSLayoutConstraint.activate([
            buttonSafeActions.topAnchor.constraint(equalTo: textTwo.bottomAnchor),
            buttonSafeActions.leadingAnchor.constraint(equalTo: stayHomeControlsContainer.leadingAnchor,constant: -25),
            buttonSafeActions.widthAnchor.constraint(equalTo: stayHomeControlsContainer.widthAnchor)
        ])
        
    }
    
    // MARK: Notifications component
    func createNotificationsBar(){
        
        notificationsBarContainer.translatesAutoresizingMaskIntoConstraints = false
        //notificationsBarContainer.backgroundColor = .white
        view.addSubview(notificationsBarContainer)
        
        NSLayoutConstraint.activate([
            notificationsBarContainer.topAnchor.constraint(equalTo: stayHomeContainer.bottomAnchor, constant: 10),
            notificationsBarContainer.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5),
            notificationsBarContainer.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1),
            notificationsBarContainer.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1)
        ])
        
        let notificationBellContainer = UIView()
        notificationBellContainer.translatesAutoresizingMaskIntoConstraints = false
        notificationsBarContainer.addSubview(notificationBellContainer)
        NSLayoutConstraint.activate([
            notificationBellContainer.topAnchor.constraint(equalTo: notificationsBarContainer.topAnchor),
            notificationBellContainer.leadingAnchor.constraint(equalTo: notificationsBarContainer.leadingAnchor),
            notificationBellContainer.widthAnchor.constraint(equalTo: notificationsBarContainer.widthAnchor, multiplier: 0.2),
            notificationBellContainer.heightAnchor.constraint(equalTo: notificationsBarContainer.heightAnchor)
        ])
        
        let bellImage = UIImageView(image: #imageLiteral(resourceName: "gold-bell-icon-png-image-transparent-background"))
        bellImage.translatesAutoresizingMaskIntoConstraints = false
        notificationBellContainer.addSubview(bellImage)
        NSLayoutConstraint.activate([
            bellImage.centerYAnchor.constraint(equalTo: notificationBellContainer.centerYAnchor),
            bellImage.heightAnchor.constraint(equalTo: notificationBellContainer.heightAnchor, multiplier: 0.8),
            bellImage.widthAnchor.constraint(equalTo: notificationBellContainer.widthAnchor, multiplier: 0.8, constant: -5),
        ])
        
        notificationsBarContainer.addSubview(buttonNotifications)
        NSLayoutConstraint.activate([
            buttonNotifications.centerYAnchor.constraint(equalTo: notificationBellContainer.centerYAnchor),
            buttonNotifications.leadingAnchor.constraint(equalTo: notificationBellContainer.trailingAnchor, constant: -40),
            buttonNotifications.widthAnchor.constraint(equalTo: notificationsBarContainer.widthAnchor)
        ])
    }
    
    // MARK: See more component
    func createSeeMoreContainer(){
        
        seeMore.translatesAutoresizingMaskIntoConstraints = false
        //seeMore.backgroundColor = .white
        view.addSubview(seeMore)
        
        NSLayoutConstraint.activate([
            seeMore.topAnchor.constraint(equalTo: notificationsBarContainer.bottomAnchor, constant: 7),
            seeMore.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5),
            seeMore.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1),
            seeMore.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1)
        ])
        
        let leftTextContainer = UIView()
        leftTextContainer.translatesAutoresizingMaskIntoConstraints = false
        //leftTextContainer.backgroundColor = .green
        seeMore.addSubview(leftTextContainer)
        
        NSLayoutConstraint.activate([
            leftTextContainer.topAnchor.constraint(equalTo: seeMore.topAnchor),
            leftTextContainer.leadingAnchor.constraint(equalTo: seeMore.leadingAnchor),
            leftTextContainer.widthAnchor.constraint(equalTo: seeMore.widthAnchor, multiplier: 0.5),
            leftTextContainer.heightAnchor.constraint(equalTo: seeMore.heightAnchor)
        ])
        
        let rightButtonContainer = UIView()
        rightButtonContainer.translatesAutoresizingMaskIntoConstraints = false
        //rightButtonContainer.backgroundColor = .blue
        seeMore.addSubview(rightButtonContainer)
        
        NSLayoutConstraint.activate([
            rightButtonContainer.topAnchor.constraint(equalTo: seeMore.topAnchor),
            rightButtonContainer.leadingAnchor.constraint(equalTo: leftTextContainer.trailingAnchor),
            rightButtonContainer.widthAnchor.constraint(equalTo: seeMore.widthAnchor, multiplier: 0.5),
            rightButtonContainer.heightAnchor.constraint(equalTo: seeMore.heightAnchor)
        ])
        
        let textLeft: UITextView = {
            
            let textView = UITextView()
            textView.text = "University case Updates"
            textView.textColor = .orange
            textView.font = UIFont.boldSystemFont(ofSize: 15)
            textView.textAlignment = .left
            textView.isEditable = false
            textView.isScrollEnabled = false
            textView.backgroundColor = .black
            textView.translatesAutoresizingMaskIntoConstraints = false
            
            return textView
        }()
        
        leftTextContainer.addSubview(textLeft)
        NSLayoutConstraint.activate([
            textLeft.centerYAnchor.constraint(equalTo: leftTextContainer.centerYAnchor),
            textLeft.leadingAnchor.constraint(equalTo: leftTextContainer.leadingAnchor),
            textLeft.widthAnchor.constraint(equalTo: leftTextContainer.widthAnchor)
        ])
        
        rightButtonContainer.addSubview(buttonSeeMore)
        NSLayoutConstraint.activate([
            buttonSeeMore.centerYAnchor.constraint(equalTo: rightButtonContainer.centerYAnchor),
            buttonSeeMore.trailingAnchor.constraint(equalTo: rightButtonContainer.trailingAnchor, constant: 40),
            buttonSeeMore.widthAnchor.constraint(equalTo: rightButtonContainer.widthAnchor)
        ])
        
    }
    
    // MARK: University case update
    func createUniversityCaseUpdateContainer(){
        
        universityCaseUpdatesContainer.translatesAutoresizingMaskIntoConstraints = false
        //universityCaseUpdatesContainer.backgroundColor = .gray
        view.addSubview(universityCaseUpdatesContainer)
        
        NSLayoutConstraint.activate([
            universityCaseUpdatesContainer.topAnchor.constraint(equalTo: seeMore.bottomAnchor),
            universityCaseUpdatesContainer.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5),
            universityCaseUpdatesContainer.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1),
            universityCaseUpdatesContainer.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.2)
        ])
        
        // MARK: Infected Data Area
        let infectedIconContainer = UIView()
        infectedIconContainer.translatesAutoresizingMaskIntoConstraints = false
        infectedIconContainer.backgroundColor = .orange
        universityCaseUpdatesContainer.addSubview(infectedIconContainer)
        NSLayoutConstraint.activate([
            infectedIconContainer.topAnchor.constraint(equalTo: universityCaseUpdatesContainer.topAnchor),
            infectedIconContainer.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 15),
            infectedIconContainer.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3),
            infectedIconContainer.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.06)
        ])
        
        let infectedValueContainer = UIView()
        infectedValueContainer.translatesAutoresizingMaskIntoConstraints = false
        infectedValueContainer.backgroundColor = .green
        universityCaseUpdatesContainer.addSubview(infectedValueContainer)
        NSLayoutConstraint.activate([
            infectedValueContainer.topAnchor.constraint(equalTo: infectedIconContainer.bottomAnchor),
            infectedValueContainer.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 15),
            infectedValueContainer.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3),
            infectedValueContainer.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1)
        ])
        
        let infectedLabelContainer = UIView()
        infectedLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        infectedLabelContainer.backgroundColor = .black
        universityCaseUpdatesContainer.addSubview(infectedLabelContainer)
        NSLayoutConstraint.activate([
            infectedLabelContainer.topAnchor.constraint(equalTo: infectedValueContainer.bottomAnchor),
            infectedLabelContainer.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 15),
            infectedLabelContainer.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3),
            infectedLabelContainer.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.04)
        ])
 
        
        // MARK: Deaths Area
        let deathsIconContainer = UIView()
        deathsIconContainer.translatesAutoresizingMaskIntoConstraints = false
        deathsIconContainer.backgroundColor = .orange
        universityCaseUpdatesContainer.addSubview(deathsIconContainer)
        NSLayoutConstraint.activate([
            deathsIconContainer.topAnchor.constraint(equalTo: universityCaseUpdatesContainer.topAnchor),
            deathsIconContainer.leadingAnchor.constraint(equalTo: infectedIconContainer.trailingAnchor, constant: 10),
            deathsIconContainer.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3),
            deathsIconContainer.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.06)
        ])
        
        let deathsValueContainer = UIView()
        deathsValueContainer.translatesAutoresizingMaskIntoConstraints = false
        deathsValueContainer.backgroundColor = .green
        universityCaseUpdatesContainer.addSubview(deathsValueContainer)
        NSLayoutConstraint.activate([
            deathsValueContainer.topAnchor.constraint(equalTo: infectedIconContainer.bottomAnchor),
            deathsValueContainer.leadingAnchor.constraint(equalTo: infectedValueContainer.trailingAnchor, constant: 10),
            deathsValueContainer.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3),
            deathsValueContainer.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1)
        ])
        
        let deathsLabelContainer = UIView()
        deathsLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        deathsLabelContainer.backgroundColor = .black
        universityCaseUpdatesContainer.addSubview(deathsLabelContainer)
        NSLayoutConstraint.activate([
            deathsLabelContainer.topAnchor.constraint(equalTo: infectedValueContainer.bottomAnchor),
            deathsLabelContainer.leadingAnchor.constraint(equalTo: infectedLabelContainer.trailingAnchor, constant: 10),
            deathsLabelContainer.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3),
            deathsLabelContainer.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.04)
        ])
        
        // MARK: Recovered Area
        let recoveredIconContainer = UIView()
        recoveredIconContainer.translatesAutoresizingMaskIntoConstraints = false
        recoveredIconContainer.backgroundColor = .orange
        universityCaseUpdatesContainer.addSubview(recoveredIconContainer)
        NSLayoutConstraint.activate([
            recoveredIconContainer.topAnchor.constraint(equalTo: universityCaseUpdatesContainer.topAnchor),
            recoveredIconContainer.leadingAnchor.constraint(equalTo: deathsIconContainer.trailingAnchor, constant: 10),
            recoveredIconContainer.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3),
            recoveredIconContainer.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.06)
        ])
        
        let recoveredValueContainer = UIView()
        recoveredValueContainer.translatesAutoresizingMaskIntoConstraints = false
        recoveredValueContainer.backgroundColor = .green
        universityCaseUpdatesContainer.addSubview(recoveredValueContainer)
        NSLayoutConstraint.activate([
            recoveredValueContainer.topAnchor.constraint(equalTo: recoveredIconContainer.bottomAnchor),
            recoveredValueContainer.leadingAnchor.constraint(equalTo: deathsValueContainer.trailingAnchor, constant: 10),
            recoveredValueContainer.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3),
            recoveredValueContainer.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1)
        ])
        
        let recoveredLabelContainer = UIView()
        recoveredLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        recoveredLabelContainer.backgroundColor = .orange
        universityCaseUpdatesContainer.addSubview(recoveredLabelContainer)
        NSLayoutConstraint.activate([
            recoveredLabelContainer.topAnchor.constraint(equalTo: recoveredValueContainer.bottomAnchor),
            recoveredLabelContainer.leadingAnchor.constraint(equalTo: deathsLabelContainer.trailingAnchor, constant: 10),
            recoveredLabelContainer.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3),
            recoveredLabelContainer.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.04)
        ])
        
    }
    
    // MARK: Map component
    func createMapViewContainer(){
        
        mapViewContainer.translatesAutoresizingMaskIntoConstraints = false
        mapViewContainer.backgroundColor = .white
        view.addSubview(mapViewContainer)
        
        NSLayoutConstraint.activate([
            mapViewContainer.topAnchor.constraint(equalTo: universityCaseUpdatesContainer.bottomAnchor, constant: 10),
            mapViewContainer.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5),
            mapViewContainer.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1),
            mapViewContainer.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.25)
        ])
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
