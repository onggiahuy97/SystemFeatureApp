//
//  OutlineView.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/3/22.
//

import SwiftUI

struct OutlineView: View {
    static let TagID: String? = "OutlineView"
    
    @EnvironmentObject var appViewModel: AppViewModel
    @State private var searchText = ""
    
    var unsearchSectionOutlines: some View {
        ForEach(appViewModel.sectionOutlines) { sectionOutline in
            Section(sectionOutline.title) {
                List(sectionOutline.outlines) { outline in
                    OutlineLabelView(outline: outline)
                }
            }
        }
    }
    
    var searchSectionOutlines: some View {
        List(appViewModel.searchOutlines) { outline in
            OutlineLabelView(outline: outline)
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                if appViewModel.searchText.isEmpty {
                    unsearchSectionOutlines
                } else {
                    searchSectionOutlines
                }
            }
            .searchable(text: $appViewModel.searchText)
            .navigationTitle("Feature")
        }
    }
}

