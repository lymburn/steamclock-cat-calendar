//
//  DateExtensionTests.swift
//  cat-calendarTests
//
//  Created by Eugene Lu on 2022-08-30.
//

import XCTest
@testable import cat_calendar

class DateExtensionTests: XCTestCase {
    func testDaysOfWeek() throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let dateString = "30/08/2022"
        let date = dateFormatter.date(from: dateString)!
        let expectedDateStrings = ["28/08/2022", "29/08/2022", "30/08/2022", "31/08/2022", "01/09/2022", "02/09/2022", "03/09/2022"]
        let expectedDates = expectedDateStrings.map { dateFormatter.date(from: $0)! }
        
        let daysOfWeek = date.getDaysOfWeek()

        XCTAssertEqual(daysOfWeek.count, 7)
        
        for index in 0..<7 {
            XCTAssertEqual(daysOfWeek[index], expectedDates[index])
        }
    }

}
