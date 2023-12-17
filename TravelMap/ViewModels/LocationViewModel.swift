//
//  LocationViewModel.swift
//  TravelMap
//
//  Created by loren on 2023/12/16.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    @Published var currentLocation: Location {
        didSet {
            self.updateCurrentRegion(location: currentLocation)
        }
    }
    
    @Published var currentRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    let currentSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.currentLocation = locations.first!
        
        self.updateCurrentRegion(location: locations.first!)
    }
    
    func updateCurrentRegion(location: Location) {
        withAnimation(.easeInOut) {
            self.currentRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: self.currentSpan
            )
        }
    }
    
}
