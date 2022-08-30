//
//  Errors.swift
//  cat-calendar
//
//  Created by Eugene Lu on 2022-08-30.
//

import Foundation

/// Custom errors thrown in `CalendarListViewModel`.
enum CalendarListViewModelError: Error {
    /// Error when the number of cat image models fetched doesn't match the number of days in the week.
    case catImageModelsCountMismatch
    /// Error when the number of downloaded cat images doesn't match the number of days in the week.
    case downloadedCatImagesCountMismatch
}
