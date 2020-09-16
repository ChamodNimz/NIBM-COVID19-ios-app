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
        textfield.backgroundColor = .gray
        textfield.textColor = .white
        textfield.layer.cornerRadius = 4.0
        textfield.layer.borderWidth = 1
     
        return textfield
        
    }()
    
    private let updateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Update", for: .normal)
        button.setTitleColor(UIColor(white: 1, alpha: 1), for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(handleOnCickUpdate), for: .touchUpInside)
        
        return button
    }()
    
    
    // MARK: - Lifecycale
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
        getUserTemp()
        
        Service.shared.fetchUserData(uid: Service.shared.currentUid ?? ""){(user)in
            if(user.accountType == AccountType.student){
                self.buttonCreateNotifications.isHidden = true
            }
        }
    }
    
    //MARK: Methods
    
    func getUserTemp(){
        
        Service.shared.readTempValue(){(temp) in
            
            self.temperatureValue.text = temp
        }
    }
    
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
        temperatureValue.leadingAnchor.constraint(equalTo: tempUpdateView.leadingAnchor, constant: 130).isActive = true
        
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
        tempUpdatetimeLable.leadingAnchor.constraint(equalTo: tempUpdateView.leadingAnchor, constant: 100).isActive = true
        
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
        
        guard let currentUserTemp = temperatureTextFiled.text else { return }
        
        Service.shared.updateTemp(value: currentUserTemp){(isUpdated) in
            
            if(isUpdated){
                let alert: UIAlertController = {
                    return UIAlertController().showSuccessAlert(message: "Successfully updated temparature!")
                }()
                self.present(alert, animated: true)
                
                Service.shared.readTempValue(){(temp)in
                    self.temperatureValue.text = temp
                }
                
            }else{
                let alert: UIAlertController = {
                    return UIAlertController().showErrorAlert(message: "Something went wrong")
                }()
                self.present(alert, animated: true)
            }
        }
        Service.shared.triggerUserCollectionUpdate()
    }
    
    //MARK: API
    
}
