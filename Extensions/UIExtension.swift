//
//  UIExtension.swift
//  NIBM COVID19
//
//  Created by chamod Nimsara on 9/3/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import MapKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func centerX(inView view: UIView) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(inView view: UIView) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func centerY(inView view: UIView, constant: CGFloat = 0) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }
    
    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func inputContainerView(image: UIImage, textField: UITextField? = nil, segentedControl: UISegmentedControl? = nil) -> UIView {
           let view = UIView()
           
           let imageView = UIImageView()
           imageView.image = image
           imageView.alpha = 0.87
           view.addSubview(imageView)
           
           if let textField = textField {
               imageView.centerY(inView: view)
               imageView.anchor(left: view.leftAnchor, paddingLeft: 8, width: 24, height: 24)
               
               view.addSubview(textField)
               textField.centerY(inView: view)
               textField.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
           }
           
           if let segentedControl = segentedControl {
               imageView.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: -8, paddingLeft: 8, width: 24, height: 24)
               
               view.addSubview(segentedControl)
               segentedControl.anchor(left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 8, paddingRight: 8)
               segentedControl.centerY(inView: view, constant: 8)
           }
           
           let separatorView = UIView()
           separatorView.backgroundColor = .lightGray
           view.addSubview(separatorView)
           separatorView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, height: 0.75)
           
           return view
       }
}

extension UITextField {
    
    func textField(withPlaceholder placeholder: String, isSecureTextEntry: Bool) -> UITextField{
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.textColor = .white
        tf.keyboardAppearance = .dark
        tf.isSecureTextEntry = isSecureTextEntry
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        return tf
    }
}

extension UIAlertController{
    
    func showErrorAlert(message:String)-> UIAlertController{
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        
        return alert
    }
    
    func showWarningAlert(message:String)-> UIAlertController{
        
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        
        return alert
    }
    
    func showSuccessAlert(message:String)-> UIAlertController{
        
        let alert = UIAlertController(title: "Yay", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        
        return alert
    }
    
}

extension UIButton {
    
    func alignImageAndTitleVertically(padding: CGFloat = 5.0) {
        self.sizeToFit()
        let imageSize = self.imageView!.frame.size
        let titleSize = self.titleLabel!.frame.size
        let totalHeight = imageSize.height + titleSize.height + padding

        self.imageEdgeInsets = UIEdgeInsets(
            top: -(totalHeight - imageSize.height),
            left: 0,
            bottom: 0,
            right: -titleSize.width - 10
        )

        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: -(totalHeight - titleSize.height),
            right: titleSize.height
        )
    }
    
    func createButtonWithRightForwardIcon() -> UIButton{
        
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "forward"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 6,left: 100,bottom: 6,right: 14)
        button.titleEdgeInsets = UIEdgeInsets(top: 0,left: -30,bottom: 0,right: 34)
        
        return button
    }
    
    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.55
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.masksToBounds = false
    }
    
}

extension MKMapView {
    
    func zoomToFit(annotations: [MKAnnotation]) {
        var zoomRect = MKMapRect.null
        
        annotations.forEach { (annotation) in
            let annotationPoint = MKMapPoint(annotation.coordinate)
            let pointRect = MKMapRect(x: annotationPoint.x, y: annotationPoint.y,
                                      width: 0.01, height: 0.01)
            zoomRect = zoomRect.union(pointRect)
        }
        
        let insets = UIEdgeInsets(top: 100, left: 100, bottom: 300, right: 100)
        setVisibleMapRect(zoomRect, edgePadding: insets, animated: true)
    }
    
    func zoomToFit(annotation: MKAnnotation) {
        
        var zoomRect = MKMapRect.null
        
            let annotationPoint = MKMapPoint(annotation.coordinate)
            let pointRect = MKMapRect(x: annotationPoint.x, y: annotationPoint.y,
                                      width: 65, height: 65)
            zoomRect = zoomRect.union(pointRect)
 
        
        let insets = UIEdgeInsets(top: 200, left: 200, bottom: 200, right: 200)
        setVisibleMapRect(zoomRect, edgePadding: insets, animated: true)
    }
    
    
    func addAnnotationAndSelect(forCoordinate coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        addAnnotation(annotation)
        selectAnnotation(annotation, animated: true)
    }
}
