//
//  Buttons.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/4/22.
//

import SwiftUI

let buttonSectionOutline: SectionOutline = {
    var buttonOutlines: [Outline] = []
    buttonOutlines.append(contentsOf: [
        colorPickerButtonOutline,
        hapticButtonOutline,
        gesturesButtonOutline
    ])
    let buttonSection = SectionOutline(title: "Button", outlines: buttonOutlines)
    return buttonSection
}()

fileprivate let colorPickerButtonOutline: Outline = {
    var colorPickerOutline = Outline(title: "Color Picker", outlineType: .outlineView(AnyView(ColorPickerView.init())))
    colorPickerOutline.systemImage = "paintbrush.fill"
    colorPickerOutline.foregroundColor = "Blue"
    return colorPickerOutline
}()

fileprivate let hapticButtonOutline: Outline = {
    let hapticButtonView = AnyView(HapticButtonsView.init())
    var hapticOutline = Outline(title: "Haptics Button", outlineType: .outlineView(hapticButtonView))
    hapticOutline.systemImage = "dot.circle.and.hand.point.up.left.fill"
    hapticOutline.foregroundColor = "Red"
    return hapticOutline
}()

fileprivate let gesturesButtonOutline: Outline = {
    let guesturesButtonView = AnyView(GesturesButtonView.init())
    var gestureOutline = Outline(title: "Gestures", outlineType: .outlineView(guesturesButtonView))
    gestureOutline.systemImage = "hand.draw.fill"
    gestureOutline.foregroundColor = "Red"
    return gestureOutline
}()
