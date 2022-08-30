//
//  CatImageServiceType.swift
//  cat-calendar
//
//  Created by Eugene Lu on 2022-08-30.
//

import Foundation
import UIKit

protocol CatImageServiceType {
    /// Returns a list of cat image models fetched from the API.
    /// - Parameters:
    ///     - limit: The number of cat image models to fetch.
    func fetchCatImageModels(limit: Int) async throws -> [CatImageModel]
    
    /// Downloads cat images for a batch of url strings and returns a list of `UIImage` items.
    /// - Parameters:
    ///     - urlStrings: The array of url strings to download images from.
    func downloadCatImages(forUrls urlStrings: [String]) async throws -> [UIImage]
}
