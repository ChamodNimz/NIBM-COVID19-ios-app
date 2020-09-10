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
        title = "Update"
        
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
        
    }
    
    @objc func handleOnClickCreateNotifications(){
        
//        let vc = QuestionOneViewController()
//        vc.modalPresentationStyle = .fullScreen
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleOnClickNewSurvey(){
        
        let vc = QuestionOneViewController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: API
    
}
