//
//  SectionOutline.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/3/22.
//

import Foundation

struct SectionOutline: Identifiable {
    var id: String { title }
    var title: String
    var outlines: [Outline]
    
    init(title: String, outlines: [Outline]) {
        self.title = title
        self.outlines = outlines
    }
}

extension SectionOutline {
    static var examples: [SectionOutline] {
        [
            .init(title: "Section 1", outlines: Outline.examples),
            .init(title: "Section 2", outlines: Outline.examples)
        ]
    }
}
