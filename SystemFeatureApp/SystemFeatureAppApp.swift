//
//  SystemFeatureAppApp.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/2/22.
//

import SwiftUI

@main
struct SystemFeatureAppApp: App {
    @StateObject var appViewModel = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appViewModel)
        }
    }
}
