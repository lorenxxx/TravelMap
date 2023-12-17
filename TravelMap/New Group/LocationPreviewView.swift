//
//  LocationPreviewView.swift
//  TravelMap
//
//  Created by loren on 2023/12/17.
//

import SwiftUI

struct LocationPreviewView: View {
    
    let location: Location
    
    var body: some View {
        HStack {
            VStack(spacing: 16.0) {
                imageSection
                titleSetcion
            }
            
            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
        }
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
    }
    
    private var learnMoreButton: some View {
        Button(action: {
            
        }, label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125.0, height: 35.0)
        })
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button(action: {
            
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
    }
}
