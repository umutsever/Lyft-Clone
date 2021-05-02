//
//  LocationCell.swift
//  Lyft-Clone
//
//  Created by Umut Sever on 29.04.2021.
//

import UIKit
import MapKit

class LocationCell: UITableViewCell {
    
    @IBOutlet weak var adressLine1Label: UILabel!
    @IBOutlet weak var adressLine2Label: UILabel!
    
    
    
    func update(location: Location) {
        adressLine1Label.text = location.title
        adressLine2Label.text = location.subtitle
    }
    
    func update(searchResult: MKLocalSearchCompletion){
        adressLine1Label.text = searchResult.title
        adressLine2Label.text = searchResult.subtitle
    }
   
    
}
