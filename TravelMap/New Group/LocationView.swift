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
            //Map(coordinateRegion: $locationViewModel.currentRegion).ignoresSafeArea()
            
            mapLayer
                .ignoresSafeArea()
            
            VStack {
                header
                    .padding()
                
                Spacer()
                
                locationPreviewStack
            }
        }
        .sheet(item: $locationViewModel.sheetLocation, onDismiss: nil) { location in
             LocationDetailView(location: location)
        }
    }
}

extension LocationView {
    
    private var mapLayer: some View {
        Map(
            coordinateRegion: $locationViewModel.currentRegion,
            annotationItems: locationViewModel.locations,
            annotationContent: { location in
                //MapMarker(coordinate: location.coordinates, tint: .blue)
                MapAnnotation(coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .scaleEffect(locationViewModel.currentLocation == location ? 1.0 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            locationViewModel.showNextLocation(location: location)
                        }
                }
            }
        )
    }
    
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
    
    private var locationPreviewStack: some View {
        ZStack {
            ForEach(locationViewModel.locations) { location in
                if locationViewModel.currentLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: .black.opacity(0.3), radius: 20.0)
                        .padding()
                        .transition(
                            .asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading)
                            )
                        )
                }
            }
        }
    }
}

#Preview {
    LocationView()
        .environmentObject(LocationViewModel())
}
