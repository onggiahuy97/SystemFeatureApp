//
//  ColorPickerView.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/4/22.
//

import SwiftUI

struct ColorPickerView: View {
    @State private var color = Color.blue
    
    var body: some View {
        ZStack {
            color
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                ColorPicker("Pick Color", selection: $color)
            }
        }
    }
}
