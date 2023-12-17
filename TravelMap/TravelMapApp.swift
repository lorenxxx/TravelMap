//
//  TravelMapApp.swift
//  TravelMap
//
//  Created by loren on 2023/12/16.
//

import SwiftUI

@main
struct TravelMapApp: App {
    
    @StateObject private var locationViewModel: LocationViewModel = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(locationViewModel)
        }
    }
}
