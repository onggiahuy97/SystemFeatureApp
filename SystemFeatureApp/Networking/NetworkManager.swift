//
//  NetworkManager.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/11/22.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    enum ImageError: String, Error {
        case failedURL, failedLoadImage
    }
    
    func loadImageWithoutCached(url: String, completion: @escaping ((Result<UIImage, ImageError>) -> Void)) {
        guard let url = URL(string: url) else {
            completion(.failure(.failedURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil {
                completion(.failure(.failedLoadImage))
                return
            }
            
            if let data = data {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        completion(.success(image))
                    }
                    return
                }
            } else {
                completion(.failure(.failedLoadImage))
                return
            }
            
        }
        .resume()
        
    }
}
