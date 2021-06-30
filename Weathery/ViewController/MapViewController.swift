//
//  MapViewController.swift
//  Weathery
//
//  Created by Manuel Lorenzo (@noloman) on 29/06/2021.
//

import UIKit
import MapKit

class CityLocation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    init(latitude: Float, longitude: Float) {
        self.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees.init(latitude), longitude: CLLocationDegrees.init(longitude))
    }
}

class MapViewController: UIViewController, MKMapViewDelegate {
    var latitude: Float
    var longitude: Float
    let mapView: MKMapView
    
    init(lat:Float, long: Float) {
        latitude = lat
        longitude = long
        self.mapView = MKMapView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        mapView.addAnnotation(CityLocation(latitude: 37.39, longitude: -122.08))
    }
    
    func setupMapView() {
        view.addSubview(mapView)
    }
}
