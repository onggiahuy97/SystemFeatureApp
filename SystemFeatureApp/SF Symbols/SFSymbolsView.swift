//
//  SFSymbolsView.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/7/22.
//

import SwiftUI

struct SFSymbolsView: View {
    let columns: [GridItem] = [GridItem.init(.adaptive(minimum: 60))]
    let symbols = SFSymbolsViewModel.SFSymbols
    
    
    @State private var showPopover = false
    
    @StateObject var viewModel = SFSymbolsViewModel()
    
    var body: some View {
        NavigationStack {
            List(symbols, id: \.type) { type in
                NavigationLink {
                    NavigationStack {
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 12) {
                                ForEach(type.symbols, id: \.self) { name in
                                    Button {
                                        showPopover.toggle()
                                    } label: {
                                        ZStack {
                                            Image(systemName: name)
                                                .imageScale(.large)
                                        }
                                        .frame(width: 60, height: 60)
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(12)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .padding(.horizontal)
                        }
                        .navigationBarTitle(type.type.forResource)
                    }
                } label: {
                    Label(type.type.forResource, systemImage: type.type.typeSystemImage)
                }
            }
            .navigationTitle("SF Symbols")
            .searchable(text: $viewModel.searchText)
            .searchSuggestions {
                ForEach(viewModel.searchSymbolString, id: \.self) { symbol in
                    Label(symbol, systemImage: symbol)
                        .imageScale(.large)
                        .padding()
                }
            }
        }
    }
}
