//
//  OutlineLabelView.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/3/22.
//

import SwiftUI

struct OutlineLabelView: View {
    var outline: Outline
    
    var body: some View {
        NavigationLink {
            contentView()
                .navigationTitle(outline.title)
        } label: {
            HStack(alignment: .center) {
                Image(systemName: outline.systemImage ?? "questionmark.app")
                    .imageScale(.large)
                    .foregroundColor(Color(outline.foregroundColor ?? "Default"))
                Text(outline.title)
            }
        }
    }
    
    @ViewBuilder
    private func contentView() -> some View {
        switch outline.outlineType {
        case .outlineView(let outlineView):
            AnyView(outlineView)
        case .subOutlines(let subOutlines):
            List(subOutlines, rowContent: OutlineLabelView.init)
        }
    }
}
