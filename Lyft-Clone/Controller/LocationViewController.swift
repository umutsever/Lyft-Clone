//
//  LocationViewController.swift
//  Lyft-Clone
//
//  Created by Umut Sever on 2.05.2021.
//

import UIKit
import MapKit

class LocationViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate, MKLocalSearchCompleterDelegate {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var locations = [Location]()
    var pickupLocation : Location?
    var dropoffLocation: Location?
    
    var searchCompleter = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()
    
    @IBOutlet weak var dropoffTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropoffTextField.becomeFirstResponder()
        dropoffTextField.delegate = self
        
        locations = LocationService.shared.getRecentLocations()
        
        searchCompleter.delegate = self
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let latestString = (textField.text as! NSString).replacingCharacters(in: range, with: string)
        
        if latestString.count > 3 {
            searchCompleter.queryFragment = latestString
        }
        
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.isEmpty ? locations.count : searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell") as! LocationCell
        if searchResults.isEmpty {
            let location = locations[indexPath.row]
            cell.update(location: location)
        } else {
            let searchResult = searchResults[indexPath.row]
            cell.update(searchResult: searchResult)
        }
       
        return cell
    }
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
        
        tableView.reloadData()
        
    }
}
