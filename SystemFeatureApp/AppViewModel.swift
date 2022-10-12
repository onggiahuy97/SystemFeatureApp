//
//  AppViewModel.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/3/22.
//

import SwiftUI

class AppViewModel: ObservableObject {
    @Published private(set) var sectionOutlines: [SectionOutline] = []
    @Published var searchText: String = ""
    
    private var allOutlines: [Outline] {
        var outlines = [Outline]()
        sectionOutlines.forEach { sectionOutline in
            outlines.append(contentsOf: sectionOutline.outlines)
        }
        return outlines
    }

    var searchOutlines: [Outline] {
        allOutlines.filter { outline in
            outline.title.lowercased().contains(searchText.lowercased())
        }
    }
    
    init() {
        sectionOutlines.append(buttonSectionOutline)
        sectionOutlines.append(controlsSectionOutline)
        sectionOutlines.append(sfSymbolsSectionOutline)
        sectionOutlines.append(animationSectionOutline)
        sectionOutlines.append(imageSectionOutline)
    }
}
