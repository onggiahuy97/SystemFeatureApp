//
//  DragGestureView.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/6/22.
//

import SwiftUI

struct DragGestureView: View {
    @State private var location: CGPoint = CGPoint(x: 50, y: 50)
    @GestureState private var fingerLocation: CGPoint? = nil
    @GestureState private var startLocation: CGPoint? = nil // 1
    
    var simpleDrag: some Gesture {
        DragGesture()
            .onChanged { value in
                var newLocation = startLocation ?? location // 3
                newLocation.x += value.translation.width
                newLocation.y += value.translation.height
                self.location = newLocation
            }.updating($startLocation) { (value, startLocation, transaction) in
                startLocation = startLocation ?? location // 2
            }
            .onEnded { _ in
                withAnimation(.spring()) {
                    location = CGPoint(x: 50, y: 50)
                }
            }
    }
    
    var fingerDrag: some Gesture {
        DragGesture()
            .updating($fingerLocation) { (value, fingerLocation, transaction) in
                fingerLocation = value.location
            }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.pink)
                .frame(width: 100, height: 100)
                .position(location)
                .gesture(
                    simpleDrag.simultaneously(with: fingerDrag)
                )
            if let fingerLocation = fingerLocation {
                Circle()
                    .stroke(Color.green, lineWidth: 2)
                    .frame(width: 44, height: 44)
                    .position(fingerLocation)
                
                Text(String(format: "x: %.f y: %.f", location.x, location.y))
                    .monospacedDigit()
            }
        }
    }
}

struct DragGestureView_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureView()
    }
}
