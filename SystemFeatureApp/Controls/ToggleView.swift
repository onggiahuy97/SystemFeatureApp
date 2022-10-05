//
//  ToggleView.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/4/22.
//

import SwiftUI

struct ToggleView: View {
    @State private var isOn = true
    
    var body: some View {
        Form {
            Toggle("Toggle", isOn: $isOn)
        }
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView()
    }
}
