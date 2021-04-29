//
//  LocationCell.swift
//  Lyft-Clone
//
//  Created by Umut Sever on 29.04.2021.
//

import UIKit

class LocationCell: UITableViewCell {
    
    @IBOutlet weak var adressLine1Label: UILabel!
    @IBOutlet weak var adressLine2Label: UILabel!
    
    
    
    func update(location: Location) {
        adressLine1Label.text = location.title
        adressLine2Label.text = location.subtitle
    }
    
    
    
}
