//
//  QuestionOneViewController.swift
//  NIBM COVID19
//
//  Created by chamod Nimsara on 9/7/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import Firebase

class QuestionThreeViewController: UIViewController {
    
    // MARK: - Properties
    private let buttonYes: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("YES", for: .normal)
        button.tintColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.addTarget(self, action: #selector(handleOnClickYes), for: .touchUpInside)
        return button
    }()
    
    private let buttonNo: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("NO", for: .normal)
        button.tintColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.addTarget(self, action: #selector(handleOnClickNo), for: .touchUpInside)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 4
        pageControl.currentPage = 2
        pageControl.currentPageIndicatorTintColor = .orange
        pageControl.pageIndicatorTintColor = .gray
        return pageControl
    }()
    
    private let questionTextView: UITextView = {
        
        let textView = UITextView()
        textView.text = "Have you been exposed into crowded areas ?"
        textView.textColor = .orange
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .black
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainerInset = UIEdgeInsets(top: 25, left: 25, bottom: 20, right: 20)
        
        return textView
    }()
    
    private let imageView: UIImageView = {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "3"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    // MARK: - Lifecycale
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
        
    }
    
    //MARK: Methods
    
    func configureUI(){
        
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .black
        settupBottomNavBar()
        view.addSubview(imageView)
        view.addSubview(questionTextView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 400),
            imageView.widthAnchor.constraint(equalToConstant: 450)])
        
        NSLayoutConstraint.activate([
            questionTextView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            questionTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            questionTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)])
        
    }
    
    func settupBottomNavBar(){
        
        let bottomNavigationStackView = UIStackView(arrangedSubviews: [buttonYes, pageControl, buttonNo])
        view.addSubview(bottomNavigationStackView)
        
        NSLayoutConstraint.activate([
            bottomNavigationStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomNavigationStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomNavigationStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomNavigationStackView.heightAnchor.constraint(equalToConstant: 50)])
        
        bottomNavigationStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomNavigationStackView.distribution = .fillEqually
        
    }
    
    @objc func handleOnClickYes(){
        
       navigate()
    }
    
    @objc func handleOnClickNo(){
        
        navigate()
    }
    func navigate(){
        
        let vc = QuestionFourViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: API
    
}
