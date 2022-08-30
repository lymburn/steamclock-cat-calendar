//
//  CatImageModel.swift
//  cat-calendar
//
//  Created by Eugene Lu on 2022-08-23.
//

import Foundation

/// The cat image model fetched from the API.
struct CatImageModel: Decodable {
    let id: String
    let url: String
    let width: Int?
    let height: Int?
}
