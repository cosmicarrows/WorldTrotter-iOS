//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Laurence Wingo on 10/28/17.
//  Copyright © 2017 Laurence Wingo. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
  
    var mapView: MKMapView!
    let locationManager = CLLocationManager()
    let annotationDax = MKPointAnnotation()
    let annotationRico = MKPointAnnotation()
    let annotationTotem = MKPointAnnotation()
    
    
    override func viewWillDisappear(_ animated: Bool) {

    }
        
    override func loadView() {
        
        mapView = MKMapView()
       
        view = mapView
      
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        let locationAuthStatus = CLLocationManager.authorizationStatus()
        if locationAuthStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        let daxPainting: CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: 33.763824, longitude: -84.351253)
        let ricoPainting: CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: 33.757591, longitude: -84.298911)
        let totemPainting: CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: 33.758426, longitude: -84.347227)
        annotationDax.coordinate = daxPainting
        annotationRico.coordinate = ricoPainting
        annotationTotem.coordinate = totemPainting
        mapView.addAnnotation(annotationDax)
        mapView.addAnnotation(annotationTotem)
        mapView.addAnnotation(annotationRico)
        let segmentedControl = UISegmentedControl.init(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.backgroundColor = UIColor.yellow
        view.addSubview(segmentedControl)
        let zoomButtonFrame = CGRect.init(x: 0, y: 0, width: view.bounds.width, height: 400)
        let zoomButton = UIButton.init(frame: zoomButtonFrame)
        
        
        zoomButton.backgroundColor = UIColor.green
        zoomButton.setTitle("Where Am I?", for: .normal)
        zoomButton.setTitleColor(UIColor.black, for: .normal)
        zoomButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(zoomButton)
        let guide = view.safeAreaLayoutGuide
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: guide.topAnchor, constant: 8)
        let zoomButtonTopConstraint = zoomButton.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 559)
        let margins = view.layoutMarginsGuide
        let zoomButtonLeadingConstraint = zoomButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        let zoomButtonTrailingConstraint = zoomButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        zoomButtonTopConstraint.isActive = true
        zoomButtonLeadingConstraint.isActive = true
        zoomButtonTrailingConstraint.isActive = true
        segmentedControl.addTarget(self, action:#selector(mapTypeChanged(segControl:)), for: .valueChanged)
        zoomButton.addTarget(self, action: #selector(zoomButtonTapped(zoomButt:)), for: .touchUpInside)
        let firstFriend = ListOfFriendsImages.init(frame: CGRect.init(x: 0, y: 500, width: 50, height: 50))
        let secondFriend = ListOfFriendsImages.init(frame: CGRect.init(x: 60, y: 500, width: 50, height: 50))
        let thirdFriend = ListOfFriendsImages.init(frame: CGRect.init(x: 120, y: 500, width: 50, height: 50))
        let fourthFriend = ListOfFriendsImages.init(frame: CGRect.init(x: 180, y: 500, width: 50, height: 50))
        let fifthFriend = ListOfFriendsImages.init(frame: CGRect.init(x: 240, y: 500, width: 50, height: 50))
        let sixthFriend = ListOfFriendsImages.init(frame: CGRect.init(x: 300, y: 500, width: 50, height: 50))
        let seventhFriend = ListOfFriendsImages.init(frame: CGRect.init(x: 360, y: 500, width: 50, height: 50))

        mapView.addSubview(firstFriend)
        mapView.addSubview(secondFriend)
        mapView.addSubview(thirdFriend)
        mapView.addSubview(fourthFriend)
        mapView.addSubview(fifthFriend)
        mapView.addSubview(sixthFriend)
        mapView.addSubview(seventhFriend)
    }
    
    @objc func mapTypeChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .mutedStandard
        case 2:
            mapView.mapType = .satelliteFlyover
        default:
            break
        }
    }
    
    @objc func zoomButtonTapped(zoomButt: UIButton){
        for _ in 1...5 {
            print("Pinging Your Location...")
            if zoomButt.backgroundColor == UIColor.green{
                print("this button's background color is green man.")
            }
        }
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.follow, animated: true)
        mapView.showsBuildings = true
        mapView.showsTraffic = true
        mapView.showsScale = true
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]){
        print(locations)
        if let location = locations.first{
            print("The floor is: \(String(describing: location.floor))")
            print("WHEERRREEE ARRREE MYYY LOOCCAATTIOONS locations = \(location.coordinate.latitude) \(location.coordinate.longitude)")
        }
        
    }
    
    
}
