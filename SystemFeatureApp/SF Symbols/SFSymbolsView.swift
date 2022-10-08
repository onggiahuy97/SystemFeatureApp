//
//  SFSymbolsView.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/7/22.
//

import SwiftUI

struct SFSymbolsView: View {
    let columns: [GridItem] = [GridItem.init(.adaptive(minimum: 50))]
    let symbols = SFSymbolsViewModel.SFSymbols
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(symbols, id: \.type) { type in
                    DisclosureGroup(type.type.forResource) {
                        LazyVGrid(columns: columns) {
                            ForEach(type.symbols, id: \.self) { name in
                                ZStack {
                                    Image(systemName: name)
                                        .imageScale(.large)
                                }
                                .padding(8)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(12)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("SF Symbols")
        }
    }
}
