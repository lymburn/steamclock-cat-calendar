//
//  CalendarListViewModel.swift
//  cat-calendar
//
//  Created by Eugene Lu on 2022-08-29.
//

import Foundation
import UIKit

class CalendarListViewModel {
    // MARK: Private Properties
    private let catImageService: CatImageServiceType
    private let currentDaysOfWeek = Date().getDaysOfWeek()
    
    
    // MARK: Initialization
    init(catImageService: CatImageServiceType) {
        self.catImageService = catImageService
    }
}

// MARK: Public Functions
extension CalendarListViewModel {
    /// Returns an array of `CalendarListItem` after fetching the cat images corresponding to each day of the week.
    func getCalendarListItems() async throws -> [CalendarListItem] {
        do {
            // Fetch 7 cat image models corresponding to 7 days of the week
            let catImageModels = try await catImageService.fetchCatImageModels(limit: 7)
            
            // Download the cat images from the model urls in order to get the UIImages
            let catImageUrlStrings = catImageModels.map { $0.url }
            let downloadedCatImages: [UIImage] = try await catImageService.downloadCatImages(forUrls: catImageUrlStrings)
            
            // Check that the number of cat images and days match
            guard catImageModels.count == currentDaysOfWeek.count else { throw CalendarListViewModelError.catImageModelsCountMismatch }
            guard downloadedCatImages.count == currentDaysOfWeek.count else { throw CalendarListViewModelError.downloadedCatImagesCountMismatch }
            
            // Populate and return a list of calendarListItems with the fetched data
            var calendarListItems: [CalendarListItem] = []
            
            for index in 0..<currentDaysOfWeek.count {
                let date = currentDaysOfWeek[index]
                let id = catImageModels[index].id
                let catImage = downloadedCatImages[index]
                
                calendarListItems.append(CalendarListItem(id: id, date: date, catImage: catImage))
            }
            
            return calendarListItems
        }
        catch {
            throw error
        }
    }
}
