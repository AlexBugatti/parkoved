//
//  Amusement.swift
//  Parkoved
//
//  Created by Александр on 26.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class Amusement: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var id: Int!
    var icon: UIImage!
    var images: [UIImage]!
//    var title: String
    var note: String!
    var isPresent = false
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
    class func mock() -> [Amusement] {
        let am = Amusement(coordinate: CLLocationCoordinate2D.init(latitude: 52.605352, longitude: 39.601614))
        am.icon = #imageLiteral(resourceName: "castle")
        
        let pm = Amusement(coordinate: CLLocationCoordinate2D.init(latitude: 52.605759, longitude: 39.602573))
        pm.icon = #imageLiteral(resourceName: "cafe")
        

        let sm = Amusement(coordinate: CLLocationCoordinate2D.init(latitude: 52.604495, longitude: 39.603753))
        sm.icon = #imageLiteral(resourceName: "swing")
        
        let qm = Amusement(coordinate: CLLocationCoordinate2D.init(latitude: 52.60569, longitude: 39.601))
        qm.isPresent = true
        qm.icon = #imageLiteral(resourceName: "Group 36")
        
        return [am, pm, sm, qm]
    }
    
//    @objc var coordinate: CLLocationCoordinate2D!
    
}

