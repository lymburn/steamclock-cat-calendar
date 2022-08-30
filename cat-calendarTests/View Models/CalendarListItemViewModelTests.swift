//
//  CalendarListItemViewModelTests.swift
//  cat-calendarTests
//
//  Created by Eugene Lu on 2022-08-30.
//

import XCTest
@testable import cat_calendar

class CalendarListItemViewModelTests: XCTestCase {
    var calendarListItemViewModel: CalendarListItemViewModel!
    
    override func setUpWithError() throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let dateString = "01/08/2022"
        let date = dateFormatter.date(from: dateString)!
        
        calendarListItemViewModel = CalendarListItemViewModel(calendarListItem: CalendarListItem(id: "123", date: date, catImage: UIImage()))
    }

    func testDateText() {
        XCTAssertEqual(calendarListItemViewModel.dateText, "Monday, Aug 1, 2022")
    }
    
    func testTodayLabelIsHidden() {
        XCTAssertTrue(calendarListItemViewModel.isTodayLabelHidden)
    }
    
    func testTodayLabelIsNotHidden() {
        calendarListItemViewModel = CalendarListItemViewModel(calendarListItem: CalendarListItem(id: "123", date: Date(), catImage: UIImage()))
        
        XCTAssertFalse(calendarListItemViewModel.isTodayLabelHidden)
    }
}
