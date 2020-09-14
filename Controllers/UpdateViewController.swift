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
    
//    private let tempUnit: UILabel = {
//        let label = UILabel()
//        label.text = "C"
//        label.font = UIFont(name: "Avenir-Light" , size: 25)
//        label.textColor = .gray
//
//        return label
//    }()
//
//    private let tempDegree: UILabel = {
//        let label = UILabel()
//        label.text = "o"
//        label.font = UIFont(name: "Avenir-Light" , size: 15)
//        label.textColor = .gray
//
//        return label
//    }()
    
//    let mainTempValueContainer = UIView()
//    let tempUnitContainer = UIView()
//    let lastUpdateTextContainer = UIView()
//    let updateTextBoxContainer = UIView()
//    private let buttonUpdate: AuthButtonUIButton = {
//        let button = AuthButtonUIButton(type: .system)
//        button.setTitle("Update", for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        button.addTarget(self, action: #selector(handleOnCickUpdate), for: .touchUpInside)
//        return button
//    }()
    
    private let buttonCreateNotifications: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Create notifications", for: .normal)
        button.setImage(#imageLiteral(resourceName: "forward"), for: .normal)
        button.tintColor = .orange
        button.semanticContentAttribute = .forceRightToLeft
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleOnClickCreateNotifications), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
        return button
    }()
    
    private let buttonNewSurvey: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("New Survey", for: .normal)
        button.tintColor = .orange
        button.setImage(#imageLiteral(resourceName: "forward"), for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.addTarget(self, action: #selector(handleOnClickNewSurvey), for: .touchUpInside)
        return button
    }()
    
    let titleLableView = UIView()

    
    let tempUpdateView = UIView()
    
    private let survayUpdatetimeLable: UILabel = {
        let label = UILabel()
        label.text = "Last Update :"
        label.font = UIFont(name: "Avenir-Light" , size: 15)
        label.textColor = .gray
        
        return label
    }()
    
    private let survayUpdatetime: UILabel = {
        let label = UILabel()
        label.text = "2020-01-01"
        label.font = UIFont(name: "Avenir-Light" , size: 15)
        label.textColor = .gray
        
        return label
    }()
    
    private let temperatureValue: UILabel = {
        let label = UILabel()
        label.text = "36.3"
        label.font = UIFont(name: "Avenir-Light" , size: 60)
        
        label.textColor = .gray
        label.numberOfLines = 0
        
        return label
    }()
    
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
    
    private let tempUpdatetimeLable: UILabel = {
        let label = UILabel()
        label.text = "Last Update :"
        label.font = UIFont(name: "Avenir-Light" , size: 15)
        label.textColor = .gray
        
        return label
    }()
    
    private let tempUpdatetime: UILabel = {
        let label = UILabel()
        label.text = "1 day ago"
        label.font = UIFont(name: "Avenir-Light" , size: 15)
        label.textColor = .gray
        
        return label
    }()
    
    private let temperatureTextFiled: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .line
        textfield.textColor = .white
        
        
        return textfield
        
    }()
    
    private let updateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Update", for: .normal)
        // button.font = UIFont(name: "Avenir-Light", size: 35) ?? <#default value#>
        button.setTitleColor(UIColor(white: 1, alpha: 1), for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        //           button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        //button.addTarget(self, action: #selector(handlesignin), for: .touchUpInside)
        
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
        middleNavigationStackView.alignment = .leading
        
        NSLayoutConstraint.activate([
            middleNavigationStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            middleNavigationStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            middleNavigationStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            middleNavigationStackView.heightAnchor.constraint(equalToConstant: 150)])
        
        middleNavigationStackView.translatesAutoresizingMaskIntoConstraints = false
        middleNavigationStackView.axis = .vertical
        middleNavigationStackView.distribution = .fillEqually
        
        // MARK: Update section
        
//        let tempUpdateContainer = UIView()
//        tempUpdateContainer.translatesAutoresizingMaskIntoConstraints = false
//        tempUpdateContainer.backgroundColor = .gray
//        view.addSubview(tempUpdateContainer)
//        NSLayoutConstraint.activate([
//            tempUpdateContainer.topAnchor.constraint(equalTo: middleNavigationStackView.bottomAnchor, constant: 10),
//            tempUpdateContainer.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 30),
//            tempUpdateContainer.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant:  -30),
//            tempUpdateContainer.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.6)
//        ])
        
        view.addSubview(tempUpdateView)
        tempUpdateView.translatesAutoresizingMaskIntoConstraints = false
        tempUpdateView.topAnchor.constraint(equalTo: middleNavigationStackView.bottomAnchor, constant: 10).isActive = true
        tempUpdateView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        tempUpdateView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1).isActive = true
        tempUpdateView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.3).isActive = true
        tempUpdateView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor , constant: -7).isActive = true
        
        tempUpdateView.addSubview(temperatureValue)
        temperatureValue.translatesAutoresizingMaskIntoConstraints = false
        temperatureValue.heightAnchor.constraint(equalTo: tempUpdateView.heightAnchor, multiplier: 0.3).isActive = true
        temperatureValue.topAnchor.constraint(equalTo: tempUpdateView.topAnchor, constant: 10).isActive = true
        temperatureValue.centerXAnchor.constraint(equalTo: tempUpdateView.centerXAnchor).isActive = true
        
        tempUpdateView.addSubview(tempUnit)
        tempUnit.translatesAutoresizingMaskIntoConstraints = false
        tempUnit.heightAnchor.constraint(equalTo: tempUpdateView.heightAnchor, multiplier: 0.1).isActive = true
        tempUnit.leadingAnchor.constraint(equalTo: temperatureValue.trailingAnchor, constant: 10).isActive = true
        tempUnit.topAnchor.constraint(equalTo: tempUpdateView.topAnchor, constant: 25).isActive = true
        
        tempUpdateView.addSubview(tempDegree)
        tempDegree.translatesAutoresizingMaskIntoConstraints = false
        tempDegree.heightAnchor.constraint(equalTo: tempUpdateView.heightAnchor, multiplier: 0.1).isActive = true
        tempDegree.leadingAnchor.constraint(equalTo: temperatureValue.trailingAnchor, constant: 4).isActive = true
        tempDegree.topAnchor.constraint(equalTo: tempUpdateView.topAnchor, constant: 15).isActive = true
        
        tempUpdateView.addSubview(tempUpdatetimeLable)
        tempUpdatetimeLable.translatesAutoresizingMaskIntoConstraints = false
        tempUpdatetimeLable.heightAnchor.constraint(equalTo: tempUpdateView.heightAnchor, multiplier: 0.1).isActive = true
        tempUpdatetimeLable.topAnchor.constraint(equalTo: temperatureValue.bottomAnchor, constant: 10).isActive = true
        tempUpdatetimeLable.leadingAnchor.constraint(equalTo: tempUpdateView.leadingAnchor, constant: 85).isActive = true
        
        tempUpdateView.addSubview(tempUpdatetime)
        tempUpdatetime.translatesAutoresizingMaskIntoConstraints = false
        tempUpdatetime.heightAnchor.constraint(equalTo: tempUpdateView.heightAnchor, multiplier: 0.1).isActive = true
        tempUpdatetime.topAnchor.constraint(equalTo: temperatureValue.bottomAnchor, constant: 10).isActive = true
        tempUpdatetime.leadingAnchor.constraint(equalTo: tempUpdatetimeLable.trailingAnchor, constant: 15).isActive = true
        
        tempUpdateView.addSubview(temperatureTextFiled)
        temperatureTextFiled.translatesAutoresizingMaskIntoConstraints = false
        temperatureTextFiled.heightAnchor.constraint(equalTo: tempUpdateView.heightAnchor, multiplier: 0.2).isActive = true
        temperatureTextFiled.topAnchor.constraint(equalTo: tempUpdatetime.bottomAnchor, constant: 10).isActive = true
        temperatureTextFiled.centerXAnchor.constraint(equalTo: tempUpdateView.centerXAnchor).isActive = true
        temperatureTextFiled.widthAnchor.constraint(equalTo: tempUpdateView.widthAnchor, multiplier: 0.4).isActive = true
        
        tempUpdateView.addSubview(updateButton)
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.heightAnchor.constraint(equalTo: tempUpdateView.heightAnchor, multiplier: 0.2).isActive = true
        updateButton.topAnchor.constraint(equalTo: temperatureTextFiled.bottomAnchor, constant: 10).isActive = true
        updateButton.centerXAnchor.constraint(equalTo: tempUpdateView.centerXAnchor).isActive = true
        updateButton.widthAnchor.constraint(equalTo: tempUpdateView.widthAnchor, multiplier: 0.4).isActive = true

        
        // MARK: Main Temp value container
//        mainTempValueContainer.translatesAutoresizingMaskIntoConstraints = false
//        mainTempValueContainer.backgroundColor = .orange
//        tempUpdateContainer.addSubview(mainTempValueContainer)
//        NSLayoutConstraint.activate([
//            mainTempValueContainer.topAnchor.constraint(equalTo: tempUpdateContainer.topAnchor, constant: 10),
//            mainTempValueContainer.leadingAnchor.constraint(equalTo: tempUpdateContainer.leadingAnchor, constant: 100),
//            mainTempValueContainer.trailingAnchor.constraint(equalTo: tempUpdateContainer.trailingAnchor, constant:  -100),
//            mainTempValueContainer.heightAnchor.constraint(equalTo: tempUpdateContainer.heightAnchor, multiplier: 0.2)
//        ])
//
        
//        tempUpdateContainer.addSubview(tempUnit)
//        tempUnit.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            tempUnit.topAnchor.constraint(equalTo: tempUpdateContainer.topAnchor, constant: 10),
//            tempUnit.leadingAnchor.constraint(equalTo: tempUpdateContainer.leadingAnchor, constant: 2),
//            tempUnit.widthAnchor.constraint(equalTo: tempUpdateContainer.widthAnchor, multiplier: 0.5),
//            tempUnit.heightAnchor.constraint(equalTo: tempUpdateContainer.heightAnchor, multiplier: 0.2)
//        ])
//
//        tempUpdateContainer.addSubview(tempDegree)
//        NSLayoutConstraint.activate([
//            tempDegree.topAnchor.constraint(equalTo: tempUpdateContainer.topAnchor, constant: 10),
//            tempDegree.trailingAnchor.constraint(equalTo: tempUnit.trailingAnchor, constant: 2)
//        ])
        
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
    
    @objc func handleOnCickUpdate(){
        
        
    }
    
    //MARK: API
    
}
