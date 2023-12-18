//
//  LocationMapAnnotationView.swift
//  TravelMap
//
//  Created by lorenliang on 2023/12/18.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    let accentColor: Color = Color("AccentColor")
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30.0, height: 30.0)
                .font(.headline)
                .foregroundStyle(.white)
                .padding(6)
                .background(accentColor)
                .cornerRadius(36)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.accent)
                .frame(width: 10.0, height: 10.0)
                .rotationEffect(Angle(degrees: 180.0))
                .offset(y: -3.0)
                .padding(.bottom, 40)
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        LocationMapAnnotationView()
    }
}
