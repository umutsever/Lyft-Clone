//
//  Location.swift
//  Lyft-Clone
//
//  Created by Umut Sever on 28.04.2021.
//

import Foundation

class Location: Codable {
    
    let title: String
    let subtitle: String
    let lat: Double
    let lng: Double
    
    init(title: String, subtitle: String, lat: Double, lng: Double) {
        self.title = title
        self.subtitle = subtitle
        self.lat = lat
        self.lng = lng
    }
    
}
