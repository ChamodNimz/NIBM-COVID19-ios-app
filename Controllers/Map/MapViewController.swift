//
//  MapViewController.swift
//  NIBM COVID19
//
//  Created by chamod Nimsara on 9/13/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import Firebase
import MapKit

private let annotationIdentifier = "UserAnnotation"

class MapViewController: UIViewController {
    
    // MARK: Properties
    private let mapView = MKMapView()
    //private let locationManager = CLLocationManager()
    private let locationManager = LocationHandler.shared.locationManager
    private let locationFinderUIView = LocationFinderUIView ()
    
    // MARK: Lifecyle methods
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
        enableLocationServices()
        fetchUsers()
        createLocationFinder()
    }
    
    // MARK: Methods
    func configureUI() {
        title = "Danger Areas"
        view.addSubview(mapView)
        mapView.frame = view.frame
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }
    
    func createLocationFinder(){
        
        view.addSubview(locationFinderUIView)
        locationFinderUIView.centerX(inView: view)
        locationFinderUIView.setDimensions(height: 50, width: view.frame.width - 64)
        locationFinderUIView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        locationFinderUIView.alpha = 0
        UIView.animate(withDuration: 2) {
            self.locationFinderUIView.alpha = 1
        }
    }
    
    func fetchUsers() {
        
        guard let location = locationManager?.location else { return }
        Service.shared.fetchUsersLocation(location: location) { (user) in
            guard let coordinate = user.location?.coordinate else { return }
            let annotation = UserAnnotation(uid: user.uid, coordinate: coordinate)
            
            var userIsVisible: Bool {
                
                return self.mapView.annotations.contains { (annotation) -> Bool in
                    guard let userAnno = annotation as? UserAnnotation else { return false }
                    
                    if userAnno.uid == user.uid {
                        userAnno.updateAnnotationPosition(withCoordinate: coordinate)
                        return true
                    }
                    
                    return false
                }
            }
            
            if !userIsVisible {
                self.mapView.addAnnotation(annotation)
            }
        }
    }
    
}

extension MapViewController:CLLocationManagerDelegate {
    
    func  enableLocationServices() {
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager?.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedWhenInUse:
            locationManager?.requestAlwaysAuthorization()
        case .authorizedAlways:
            locationManager?.startUpdatingLocation()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager?.requestAlwaysAuthorization()
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? UserAnnotation {
            let view = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            view.image = #imageLiteral(resourceName: "pin")
            return view
        }
        
        return nil
    }

}

