//
//  Location.swift
//  TravelMap
//
//  Created by loren on 2023/12/16.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    
    var id: String {
        self.name + self.cityName
    }
    
    let name: String
    
    let cityName: String
    
    let coordinates: CLLocationCoordinate2D
    
    let description: String
    
    let imageNames: [String]
    
    let link: String
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id
    }
    
}
