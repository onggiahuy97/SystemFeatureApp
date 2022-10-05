//
//  AppViewModel.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/3/22.
//

import SwiftUI

class AppViewModel: ObservableObject {
    @Published private(set) var sectionOutlines: [SectionOutline] = []
    
    init() {
        sectionOutlines.append(buttonSectionOutline)
    }
}
