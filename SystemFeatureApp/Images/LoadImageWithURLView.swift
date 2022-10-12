//
//  LoadImageWithURLView.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/11/22.
//

import SwiftUI

struct LoadImageWithURLView: View {
    @State private var image: UIImage?
    @State private var url: String = "https://source.unsplash.com/random"
    @State private var isShowImage = false
    @Namespace private var namespace
    
    @ViewBuilder
    var overlayView: some View {
        if let image = image {
            VStack {
                Spacer()
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            .background(Color.black)
            .opacity(isShowImage ? 1 : 0)
            .onTapGesture {
                withAnimation {
                    isShowImage.toggle()
                }
            }
        } else {
            EmptyView()
        }
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer()
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .onTapGesture {
                            withAnimation {
                                isShowImage.toggle()
                            }
                        }
                } else {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
                
                Spacer()
                
                HStack {
                    TextField("URL", text: $url)
                        .textFieldStyle(.roundedBorder)
                    Button("Load") {
                        image = nil
                        loadImage()
                    }
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .overlay(overlayView.edgesIgnoringSafeArea(.all))
            .onAppear {
                loadImage()
            }
        }
    }
    
    private func loadImage() {
        NetworkManager.shared.loadImageWithoutCached(url: url) { result in
            switch result {
            case .failure(let error):
                print(error.rawValue)
            case .success(let image):
                self.image = image
            }
        }
    }
}

struct LoadImageWithURLView_Previews: PreviewProvider {
    static var previews: some View {
        LoadImageWithURLView()
    }
}
