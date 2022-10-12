//
//  ContentView.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/2/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTabID") var selectedTabID: String?
    
    var body: some View {
        TabView(selection: $selectedTabID) {
            OutlineView()
                .tag(OutlineView.TagID)
                .tabItem {
                    Label("Feature", systemImage: "gear")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
