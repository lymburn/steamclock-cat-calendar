//
//  NetworkService.swift
//  cat-calendar
//
//  Created by Eugene Lu on 2022-08-30.
//

import Foundation
import UIKit

class CatImageService: CatImageServiceType {
    func fetchCatImageModels(limit: Int) async throws -> [CatImageModel] {
        let urlString = "\(Endpoints.catImageSearch)?limit=\(limit)"
        
        guard let url = URL(string: urlString) else { return [] }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let catImageModels = try JSONDecoder().decode([CatImageModel].self, from: data)
        return catImageModels
    }
    
    func downloadCatImages(forUrls urlStrings: [String]) async throws -> [UIImage] {
        var catImages: [UIImage] = []
        
        for urlString in urlStrings {
            guard let url = URL(string: urlString) else { continue }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            guard let catImage = UIImage(data: data) else { continue }
            catImages.append(catImage)
        }
        
        return catImages
    }
}
