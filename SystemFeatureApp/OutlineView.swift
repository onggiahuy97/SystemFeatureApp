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
    
    var body: some View {
        NavigationStack {
            Form {
                ForEach(appViewModel.sectionOutlines) { sectionOutline in
                    Section(sectionOutline.title) {
                        List(sectionOutline.outlines) { outline in
                            OutlineLabelView(outline: outline)
                        }
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Feature")
        }
    }
}

