//
//  CalendarListViewModelTests.swift
//  cat-calendarTests
//
//  Created by Eugene Lu on 2022-08-30.
//

import XCTest
@testable import cat_calendar

class CalendarListViewModelTests: XCTestCase {
    var calendarListViewModel: CalendarListViewModel!
    
    override func setUpWithError() throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let dateString = "30/08/2022"
        let date = dateFormatter.date(from: dateString)!
        
        calendarListViewModel = CalendarListViewModel(currentDate: date, catImageService: CatImageServiceStub())
    }

    func testGetCalendarListItems() async throws  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let expectedDateStrings = ["28/08/2022", "29/08/2022", "30/08/2022", "31/08/2022", "01/09/2022", "02/09/2022", "03/09/2022"]
        let expectedDates = expectedDateStrings.map { dateFormatter.date(from: $0)! }
        let expectedIds = ["0", "1", "2", "3", "4", "5", "6"]
        
        do {
            let calendarListItems = try await calendarListViewModel.getCalendarListItems()
            
            XCTAssertEqual(calendarListItems.count, 7)
            
            for index in 0..<7 {
                XCTAssertEqual(calendarListItems[index].id, expectedIds[index])
                XCTAssertEqual(calendarListItems[index].date, expectedDates[index])
            }
        }
        catch {
            throw error
        }
    }
}
