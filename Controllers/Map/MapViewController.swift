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

class MapViewController: UIViewController {
    
    // MARK: Properties
    private let mapView = MKMapView()
    private let locationManager = CLLocationManager()
    
    // MARK: Lifecyle methods
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
        enableLocationServices()
    }
    
    // MARK: Methods
    func configureUI() {
        view.addSubview(mapView)
        mapView.frame = view.frame
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }
}

extension MapViewController:CLLocationManagerDelegate {
    
    func enableLocationServices() {
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
    }
}
