//
//  HomeViewController.swift
//  Lyft-Clone
//
//  Created by Umut Sever on 28.04.2021.
//

import UIKit
import CoreLocation
import MapKit

class HomeViewController: UIViewController, UITableViewDataSource, CLLocationManagerDelegate, MKMapViewDelegate {
    
    
    
    @IBOutlet weak var searchButton: UIButton!
    
    var locations = [Location]()
    var locationManager: CLLocationManager!
    var currentUserLocation: Location!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let recentLocations = LocationService.shared.getRecentLocations()
        locations = [recentLocations[0], recentLocations[1]]
        
        
        //
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
        
        
        
        //Add shadow to searchButton
        searchButton.layer.cornerRadius = 10.0
        searchButton.layer.shadowRadius = 1.0
        searchButton.layer.shadowColor = UIColor.black.cgColor
        searchButton.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        searchButton.layer.shadowOpacity = 0.5
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let firstLocation = locations.first!
        currentUserLocation = Location(title: "Current Location", subtitle: "", lat: firstLocation.coordinate.latitude, lng: firstLocation.coordinate.longitude)
        locationManager.stopUpdatingLocation()
    }
    
   
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell") as! LocationCell
        
        let location = locations[indexPath.row]
        cell.update(location: location)
        return cell
    }
    
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        //zoom in to the user location
        let distance = 200.0
        let region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: distance, longitudinalMeters: distance)
        mapView.setRegion(region, animated: true)
    }

}
