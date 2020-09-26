//
//  Park.swift
//  Parkoved
//
//  Created by Александр on 26.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit
import CoreLocation

class Park: NSObject {

    var id: Int!
    var title: String!
    var amusements: [Amusement]!
    var coordinate: CLLocationCoordinate2D!
    var image: UIImage!
    
    static func qwe1() -> Park {
        let park = Park.init()
        
        return park
    }
    
    func all() -> [Park] {
        let park = Park.init()
        park.title = "Нижний парк"
        park.image = #imageLiteral(resourceName: "img-3")
        
        let park1 = Park.init()
        park1.title = "Верхний парк"
        park1.image = #imageLiteral(resourceName: "img-4")
        
        let park2 = Park.init()
        park2.title = "Быханов парк"
        park2.image = #imageLiteral(resourceName: "img-4")
        
        let park3 = Park.init()
        park3.title = "Парк металлургов"
        park3.image = #imageLiteral(resourceName: "img-3")
        
//        let park4 = Park.init()
//        park4.title = "Нижний парк"
//        park4.image = #imageLiteral(resourceName: "img-3")
        
        return [park, park1, park2, park3]
    }
}
