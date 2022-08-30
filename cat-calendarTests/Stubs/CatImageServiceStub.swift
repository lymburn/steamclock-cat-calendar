//
//  CatImageServiceStub.swift
//  cat-calendarTests
//
//  Created by Eugene Lu on 2022-08-30.
//

import Foundation
import UIKit
@testable import cat_calendar

class CatImageServiceStub: CatImageServiceType {
    func fetchCatImageModels(limit: Int) async throws -> [CatImageModel] {
        var catImageModels: [CatImageModel] = []
        
        for index in 0..<limit {
            catImageModels.append(CatImageModel(id: String(index), url: "testUrl", width: 100, height: 100))
        }
        
        return catImageModels
    }
    
    func downloadCatImages(forUrls urlStrings: [String]) async throws -> [UIImage] {
        var images: [UIImage] = []
        
        for _ in urlStrings {
            images.append(UIImage())
        }

        return images
    }
}
