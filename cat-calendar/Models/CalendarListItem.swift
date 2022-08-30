//
//  CalendarListItem.swift
//  cat-calendar
//
//  Created by Eugene Lu on 2022-08-29.
//

import Foundation
import UIKit

/// Represents an item in the calendar list consisting of an id, date, and cat image
struct CalendarListItem {
    // MARK: Public Properties
    let id: String
    let date: Date
    let catImage: UIImage
}

// MARK: Hashable
extension CalendarListItem: Hashable {
    static func == (lhs: CalendarListItem, rhs: CalendarListItem) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
