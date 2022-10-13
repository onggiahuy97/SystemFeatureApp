//
//  NetworkManager.swift
//  SystemFeatureApp
//
//  Created by Huy Ong on 10/11/22.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    private let session = URLSession.shared
    
    enum ImageError: String, Error {
        case failedURL, failedLoadImage
    }
    
    func loadData<T: Decodable>(url: String, completion: @escaping ((Result<T, Error>) -> Void)) {
        guard let url = URL(string: url) else { return }
        
        session.dataTask(with: url) { data, res, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            print((res as! HTTPURLResponse).statusCode)
            
            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(T.self, from: data)
                    
                    DispatchQueue.main.async {
                        completion(.success(jsonData))
                    }
                    
                    return
                } catch {
                    completion(.failure(error))
                    return
                }
            }
        }
        .resume()
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
