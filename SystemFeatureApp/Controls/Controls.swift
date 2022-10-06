//
//  Controls.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/4/22.
//

import SwiftUI

let controlsSectionOutline: SectionOutline = {
    var outlines = [Outline]()
    outlines = [
        numberInputOutline,
        toggleInputOutline
    ]
    let section = SectionOutline(title: "Control", outlines: outlines)
    return section
}()

fileprivate let numberInputOutline: Outline = {
    let numberInputsView = AnyView(NumberInputsView())
    var numberInputOutline = Outline(title: "Number Input", outlineType: .outlineView(numberInputsView))
    numberInputOutline.systemImage = "slider.horizontal.3"
    return numberInputOutline
}()

fileprivate let toggleInputOutline: Outline = {
    let toggleInputView = AnyView(ToggleView())
    var toggleInputOutline = Outline(title: "Toggle", outlineType: .outlineView(toggleInputView))
    toggleInputOutline.systemImage = "switch.2"
    return toggleInputOutline
}()
