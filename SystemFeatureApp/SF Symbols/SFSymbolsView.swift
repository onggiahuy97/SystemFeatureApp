//
//  SFSymbolsView.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/7/22.
//

import SwiftUI

struct SFSymbolsView: View {
    let symbols = SFSymbolsViewModel.SFSymbols
    let columns: [GridItem] = [GridItem.init(.adaptive(minimum: 50))]
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(symbols, id: \.self) { name in
                        ZStack {
                            Image(systemName: String(name))
                                .imageScale(.large)
                        }
                        .frame(width: 50, height: 50)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("SF Symbols")
        }
    }
}
