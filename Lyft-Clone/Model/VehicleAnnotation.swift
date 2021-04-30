//
//  VehicleAnnotation.swift
//  Lyft-Clone
//
//  Created by Umut Sever on 30.04.2021.
//

import MapKit

class VehicleAnnotation: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
}
