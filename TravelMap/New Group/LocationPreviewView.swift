//
//  LocationPreviewView.swift
//  TravelMap
//
//  Created by loren on 2023/12/17.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var locationViewModel: LocationViewModel
    
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16.0) {
                imageSection
                titleSetcion
            }
            
            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
        }
        .padding(20.0)
        .background(
            RoundedRectangle(cornerRadius: 10.0)
                .fill(.ultraThinMaterial)
                .offset(y: 65.0)
        )
        .cornerRadius(10.0)
    }
    
}

extension LocationPreviewView {
    
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10.0)
            }
        }
        .padding(6.0)
        .background(.white)
        .cornerRadius(10.0)
    }
    
    private var titleSetcion: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button(action: {
            locationViewModel.sheetLocation = location
        }, label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125.0, height: 35.0)
        })
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button(action: {
            locationViewModel.nextButtonPressed()
        }, label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125.0, height: 35.0)
        })
        .buttonStyle(.bordered)
    }
    
}

#Preview {
    ZStack {
        Color.green.ignoresSafeArea()
        
        LocationPreviewView(location: LocationViewModel().locations.first!)
            .padding()
    }
    .environmentObject(LocationViewModel())
}
