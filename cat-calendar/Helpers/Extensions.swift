//
//  Extensions.swift
//  cat-calendar
//
//  Created by Eugene Lu on 2022-08-29.
//

import Foundation
import UIKit

extension Date {
    /// Returns the days of the week, starting from Sunday and ending on Saturday, for the date being used.
    /// For example, if the date is Tuesday August 30, the result is [Aug 28, Aug 29, Aug 30, Aug 31, Sept 1, Sept 2, Sept 3]
    /// which represents days of the week for August 30.
    func getDaysOfWeek() -> [Date] {
        // Solution modified from https://stackoverflow.com/questions/44416831/list-of-dates-for-given-day-of-the-week-swift
        let calendar = Calendar.current
        let dayOfWeek = calendar.component(.weekday, from: self)
        let weekdays = calendar.range(of: .weekday, in: .weekOfYear, for: self)!
        let days = (weekdays.lowerBound..<weekdays.upperBound).compactMap { calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: self) }

        return days
    }
}

extension UIViewController {
    /// Shows a basic alert in the `UIViewController` with a default OK action.
    /// - Parameters:
    ///     - alertTitle: The title shown in the alert.
    ///     - alertMessage: The message shown in the alert.
    func showAlert(alertTitle: String, alertMessage: String) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))

        self.present(alert, animated: true, completion: nil)
    }
}
