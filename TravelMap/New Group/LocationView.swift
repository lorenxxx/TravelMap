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
            Button(action: {
                locationViewModel.toggleShowLocationList()
            }, label: {
                Text(locationViewModel.currentLocation.name + ", " + locationViewModel.currentLocation.cityName)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: locationViewModel.currentLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .padding()
                            .rotationEffect(Angle(degrees: locationViewModel.showLocationList ? 180 : 0))
                    }
            })
            
            if locationViewModel.showLocationList {
                LocationListView()
            }
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
