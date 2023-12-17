//
//  LocationView.swift
//  TravelMap
//
//  Created by loren on 2023/12/16.
//

import SwiftUI
import MapKit

struct LocationView: View {
    
    @EnvironmentObject private var locationViewModel: LocationViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $locationViewModel.currentRegion)
                .ignoresSafeArea()
            
            VStack {
                header
                    .padding()
                
                Spacer()
            }
        }
    }
}

extension LocationView {
    
    private var header: some View {
        VStack {
            Text(locationViewModel.currentLocation.name + ", " + locationViewModel.currentLocation.cityName)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                        .padding()
                }
            
            LocationListView()
        }
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0.0, y: 15.0)
    }
    
}

#Preview {
    LocationView()
        .environmentObject(LocationViewModel())
}
