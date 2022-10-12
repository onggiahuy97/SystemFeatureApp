//
//  Image.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/11/22.
//

import SwiftUI

let imageSectionOutline: SectionOutline = {
    let outlines: [Outline] = [
        loadImageOoutline
    ]
   let section = SectionOutline(title: "Images", outlines: outlines)
    return section
}()

let loadImageOoutline: Outline = {
    let view = AnyView(LoadImageWithURLView())
    var outline = Outline(title: "Load Image by URL", outlineType: .outlineView(view))
    outline.systemImage = "photo"
    outline.foregroundColor = "Blue"
    return outline
}()
