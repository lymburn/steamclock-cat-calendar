//
//  CalendarListItemViewModel.swift
//  cat-calendar
//
//  Created by Eugene Lu on 2022-08-29.
//

import Foundation

class CalendarListItemViewModel {
    // MARK: Public Properties
    let calendarListItem: CalendarListItem
    
    /// The date text to display.
    var dateText: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        
        return dateFormatter.string(from: calendarListItem.date)
    }
    
    /// The today label is shown if the calendar list item date is the same day as the current date and hidden otherwise.
    var isTodayLabelHidden: Bool {
        return !Calendar.current.isDate(calendarListItem.date, inSameDayAs: Date())
    }
    
    // MARK: Initialization
    init(calendarListItem: CalendarListItem) {
        self.calendarListItem = calendarListItem
    }
}
