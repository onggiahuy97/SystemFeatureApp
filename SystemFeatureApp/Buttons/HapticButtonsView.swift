//
//  HapticButtonsView.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/4/22.
//

import SwiftUI

struct HapticButtonsView: View {
    var body: some View {
        Form {
            createHapticButton("Soft", .soft)
            createHapticButton("Light", .light)
            createHapticButton("Medium", .medium)
            createHapticButton("Heavy", .heavy)
            createHapticButton("Regid", .rigid)
        }
    }
    
    func createHapticButton(_ text: String, _ style: UIImpactFeedbackGenerator.FeedbackStyle) -> some View {
        Button(text) {
            let impact = UIImpactFeedbackGenerator(style: style)
            impact.impactOccurred()
        }
    }
}
