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
    
    @Published var showLocationList: Bool = false
    
    @Published var sheetLocation: Location? = nil
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.currentLocation = locations.first!
        
        self.updateCurrentRegion(location: locations.first!)
    }
    
    private func updateCurrentRegion(location: Location) {
        withAnimation(.easeInOut) {
            self.currentRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: self.currentSpan
            )
        }
    }
    
    func toggleShowLocationList() {
        withAnimation(.easeInOut) {
            showLocationList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            self.currentLocation = location
            showLocationList = false
        }
    }
    
    func nextButtonPressed() {
        guard let currentLocationIndex = locations.firstIndex(where: {$0 == self.currentLocation}) else {
            print("current location index not found")
            return
        }
        
        var nextLocationIndex = currentLocationIndex + 1
        if nextLocationIndex == locations.count {
            nextLocationIndex = 0
        }
        
        let nextLocation = locations[nextLocationIndex]
        
        showNextLocation(location: nextLocation)
    }
    
}
