//
//  LocationListView.swift
//  TravelMap
//
//  Created by loren on 2023/12/17.
//

import SwiftUI

struct LocationListView: View {
    
    @EnvironmentObject private var locationViewModel: LocationViewModel
    
    var body: some View {
        List {
            ForEach(locationViewModel.locations) { location in
                Button(action: {
                    locationViewModel.showNextLocation(location: location)
                }, label: {
                    listRowView(location: location)
                })
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
    }
}

extension LocationListView {
    
    private func listRowView(location: Location) -> some View {
        return HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45.0, height: 45.0)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
}

#Preview {
    LocationListView()
        .environmentObject(LocationViewModel())
}
