//
//  QuestionOneViewController.swift
//  NIBM COVID19
//
//  Created by chamod Nimsara on 9/7/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import Firebase

class QuestionOneViewController: UIViewController {
    
    // MARK: - Properties
    private let buttonYes: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("YES", for: .normal)
        button.tintColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return button
    }()
    
    private let buttonNo: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("NO", for: .normal)
        button.tintColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = 4
        pageControl.currentPageIndicatorTintColor = .orange
        pageControl.pageIndicatorTintColor = .gray
        return pageControl
    }()
    
    private let questionTextView: UITextView = {
        
        let textView = UITextView()
        textView.text = "Are you having any symptoms above ?"
        textView.textColor = .orange
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .black
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    private let imageView: UIImageView = {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Untitled design (2)"))
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
            imageView.heightAnchor.constraint(equalToConstant: 450),
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
    
    //MARK: API
    
}
