//
//  RideQuoteService.swift
//  Lyft-Clone
//
//  Created by Umut Sever on 28.04.2021.
//

import Foundation
import CoreLocation

class RideQuoteService {
    static let shared = RideQuoteService()
    
    private init() {}
    
    func getQuotes(pickupLocation: Location, dropoffLocation: Location) -> [RideQuote] {
        let location1 = CLLocation(latitude: pickupLocation.lat, longitude: pickupLocation.lng)
        let location2 = CLLocation(latitude: dropoffLocation.lat, longitude: dropoffLocation.lng)
        
        //Meters
        let distance = location1.distance(from: location2)
        let minimumAmount = 3.0
        
        return [
            RideQuote(thumbnail: "ride-shared", name: "Shared", capacity: "1-2", price: minimumAmount + (distance * 0.5), time: Date()),
            RideQuote(thumbnail: "ride-compact", name: "Shared", capacity: "4", price: minimumAmount + (distance * 0.9), time: Date()),
            RideQuote(thumbnail: "ride-large", name: "Shared", capacity: "6", price: minimumAmount + (distance * 1.5), time: Date())
        ]
    }
    
}
