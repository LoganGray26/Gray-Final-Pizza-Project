//
//  GPSViewController.swift
//  
//
//  Created by logan gray on 5/4/20.
//

import UIKit
import CoreLocation

                                        // Dont forget to add this to your class
class GPSViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var gpsLabel: UILabel!
    
    
    
    let locMan: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    // home/pizza place
    let homeLatitude: CLLocationDegrees = 40.248720
    let homeLongitude: CLLocationDegrees = -80.189390

    

    
    
    
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation: CLLocation=locations[0]
        NSLog("Something is happening")
        
        // horizontal accuracy less than than 0 means failure at gps level
        if newLocation.horizontalAccuracy >= 0 {
            
            
            let pizza:CLLocation = CLLocation(latitude: homeLatitude,longitude: homeLongitude)

            let delta:CLLocationDistance = pizza.distance(from: newLocation)
            
            let miles: Double = (delta * 0.000621371) + 0.5 // meters to rounded miles
            
            if miles < 10 {
                // Stop updating the location
                locMan.stopUpdatingLocation()
                // Congratulate the user
                gpsLabel.text = "You are\nwithin distance !"
            } else {
                let commaDelimited: NumberFormatter = NumberFormatter()
                commaDelimited.numberStyle = NumberFormatter.Style.decimal
                
                gpsLabel.text=commaDelimited.string(from: NSNumber(value: miles))!+" miles to Logan's Pizzaria. You are out of delivery range."
            }
            
            
        }
       
    }
    
    
    
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locMan.delegate = self
        locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locMan.distanceFilter = 1609; // a mile (in meters)
        locMan.requestWhenInUseAuthorization() // verify access to gps
        locMan.startUpdatingLocation()
        startLocation = nil
    }


}
