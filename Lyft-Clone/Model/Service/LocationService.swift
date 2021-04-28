//
//  LocationService.swift
//  Lyft-Clone
//
//  Created by Umut Sever on 28.04.2021.
//

import Foundation

class LocationService {
    
    static let shared = LocationService()
    
    private var recentLocations = [Location]()
    
    
    //This is for dummy data
    private init(){
        let locationsUrl = Bundle.main.url(forResource: "locations", withExtension: "json")!
        let data = try! Data(contentsOf: locationsUrl)
        let decoder = JSONDecoder()
        recentLocations = try! decoder.decode([Location].self, from: data)
        
    }
    
    
    func getRecentLocations() -> [Location] {
        return recentLocations
    }
    
}
