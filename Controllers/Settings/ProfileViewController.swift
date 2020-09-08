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
    
    
    // MARK: - Lifecycale
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
        
    }
    
    //MARK: Methods
    
    func configureUI(){
    
        view.backgroundColor = .black
        title = "Profile"
        
    }
    
    @objc func handleOnClickUpdate(){
        
//        let vc = QuestionOneViewController()
//        vc.modalPresentationStyle = .fullScreen
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
