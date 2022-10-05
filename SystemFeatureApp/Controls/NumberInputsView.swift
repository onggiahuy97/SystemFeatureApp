//
//  NumberInputsView.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/4/22.
//

import SwiftUI

struct NumberInputsView: View {
    @State private var number = 5.0
    
    var body: some View {
        Form {
            Text("Value: \(String(format: "%.f", number))")
            Slider(value: $number, in: 0...30, step: 1)
            Stepper("Stepper", value: $number, in: 0...30, step: 1)
        }
    }
}
