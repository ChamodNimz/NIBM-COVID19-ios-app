//
//  HomeScreenViewController.swift
//  NIBM COVID19
//
//  Created by chamod Nimsara on 9/6/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import Firebase

class UpdateViewController: UIViewController {
    
    // MARK: - Properties
    
    private let tempUnit: UILabel = {
        let label = UILabel()
        label.text = "C"
        label.font = UIFont(name: "Avenir-Light" , size: 25)
        label.textColor = .gray
        
        return label
    }()
    
    private let tempDegree: UILabel = {
        let label = UILabel()
        label.text = "o"
        label.font = UIFont(name: "Avenir-Light" , size: 15)
        label.textColor = .gray
        
        return label
    }()
    
    private let buttonCreateNotifications: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Create notifications", for: .normal)
        button.tintColor = .orange
        button.semanticContentAttribute = .forceRightToLeft
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.addTarget(self, action: #selector(handleOnClickCreateNotifications), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
        return button
    }()
    
    private let buttonNewSurvey: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("New Survey", for: .normal)
        button.tintColor = .orange
        //button.setImage(#imageLiteral(resourceName: "home (3)"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.addTarget(self, action: #selector(handleOnClickNewSurvey), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Lifecycale
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
        
    }
    
    //MARK: Methods
    
    func configureUI(){

        view.backgroundColor = .black
        title = "CREATE +"
        
        let middleNavigationStackView = UIStackView(arrangedSubviews: [buttonCreateNotifications,buttonNewSurvey])
        view.addSubview(middleNavigationStackView)
        
        NSLayoutConstraint.activate([
            middleNavigationStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            middleNavigationStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            middleNavigationStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            middleNavigationStackView.heightAnchor.constraint(equalToConstant: 150)])
        
        middleNavigationStackView.translatesAutoresizingMaskIntoConstraints = false
        middleNavigationStackView.axis = .vertical
        middleNavigationStackView.distribution = .fillEqually
        
        // MARK: Update section
        
        let tempUpdateContainer = UIView()
        tempUpdateContainer.translatesAutoresizingMaskIntoConstraints = false
        tempUpdateContainer.backgroundColor = .gray
        view.addSubview(tempUpdateContainer)
        NSLayoutConstraint.activate([
            tempUpdateContainer.topAnchor.constraint(equalTo: middleNavigationStackView.bottomAnchor, constant: 10),
            tempUpdateContainer.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 30),
            tempUpdateContainer.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant:  -30),
            tempUpdateContainer.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.6)
        ])
        
        //tempUpdateContainer.addSubview(tempUnit)
        //tempUnit.translatesAutoresizingMaskIntoConstraints = false
//        tempUnit.heightAnchor.constraint(equalTo: tempUpdateView.heightAnchor, multiplier: 0.1).isActive = true
//        tempUnit.leadingAnchor.constraint(equalTo: temperatureValue.trailingAnchor, constant: 10).isActive = true
//        tempUnit.topAnchor.constraint(equalTo: tempUpdateView.topAnchor, constant: 25).isActive = true
//        NSLayoutConstraint.activate([
//            tempUnit.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
//            tempUnit.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 2),
//            tempUnit.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.5),
//            tempUnit.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.2)
//            
//        ])
        
        //tempUpdateContainer.addSubview(tempDegree)
        //tempDegree.translatesAutoresizingMaskIntoConstraints = false
//        tempDegree.heightAnchor.constraint(equalTo: tempUpdateView.heightAnchor, multiplier: 0.1).isActive = true
//        tempDegree.leadingAnchor.constraint(equalTo: temperatureValue.trailingAnchor, constant: 4).isActive = true
//        tempDegree.topAnchor.constraint(equalTo: tempUpdateView.topAnchor, constant: 15).isActive = true
        
    }
    
    @objc func handleOnClickCreateNotifications(){
        
//        let vc = QuestionOneViewController()
//        vc.modalPresentationStyle = .fullScreen
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleOnClickNewSurvey(){
        
        let vc = QuestionOneViewController()
        //vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: API
    
}
