//
//  Animations.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/9/22.
//

import SwiftUI

let animationSectionOutline: SectionOutline = {
    let outlines: [Outline] = [
        animationSwiftUIOutline
    ]
    let section = SectionOutline(title: "Animations SwiftUI", outlines: outlines)
    return section
}()

fileprivate let animationSwiftUIOutline: Outline = {
    let view = AnyView(AnimationSwiftUIView())
    var outline = Outline(title: "Animations SwiftUI", outlineType: .outlineView(view))
    outline.systemImage = "square.stack.3d.down.right"
    outline.foregroundColor = "Pink"
    return outline
}()
