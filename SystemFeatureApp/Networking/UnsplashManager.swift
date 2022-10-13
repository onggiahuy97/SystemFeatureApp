//
//  UnsplashManager.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/12/22.
//

import Foundation

class UnsplashManager {
    static let accessKey = "-lIUxzEDQijn-cnApdV3F85z3vVBnhQZu48l9EOypxU"
    static let session = URLSession.shared
    static let startpoint = "https://api.unsplash.com/"
    
    static let shared = UnsplashManager()
    
    func loadRandomImage() {
        var requestURL = Self.startpoint.appending("photos/random/")
        requestURL.append("?client_id=\(Self.accessKey)")
        print(requestURL)
    }
}
