//
//  UnsplashImageView.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/12/22.
//

import SwiftUI

struct UnsplashImageView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            Text(text)
                .lineLimit(0)
            Button("Random") {
                UnsplashManager.shared.loadRandomImage()
            }
        }
    }
    
    private func requestRandomImage() {
        NetworkManager.shared.loadData(url: "https://api.unsplash.com/photos/random") { (result: Result<Unsplash, Error>) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                text = data.color
            }
        }
    }
}

struct UnsplashImageView_Previews: PreviewProvider {
    static var previews: some View {
        UnsplashImageView()
    }
}
