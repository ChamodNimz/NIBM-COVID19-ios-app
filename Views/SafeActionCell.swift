//
//  SafeActionCell.swift
//  NIBM COVID19
//
//  Created by chamod Nimsara on 9/15/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class SafeActionCell: UICollectionViewCell {
    
    let symptomsImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "image-removebg-preview") )
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let questionTextView: UITextView = {
        
        let question = UITextView()
        let attributedText = NSMutableAttributedString(string:  "Wash your hands!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22)])
        question.attributedText = attributedText
        question.textAlignment = .center
        question.isEditable = false
        question.isScrollEnabled = false
        question.translatesAutoresizingMaskIntoConstraints = false
        return question
    }()
    
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
//        setButtonControl()
//        backgroundColor = .purple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout(){
        
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        addSubview(questionTextView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(symptomsImageView)
        symptomsImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        symptomsImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        symptomsImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.8).isActive = true
        
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        questionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor,constant: 80).isActive = true
        questionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        questionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        questionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    
}
