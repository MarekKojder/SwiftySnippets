//
//  DateExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09.07.2019.
//

import Foundation

public extension Date {

    func compare(to date: Date, withGranularity component: Calendar.Component = .second) -> ComparisonResult {
        return Calendar.current.compare(self, to: date, toGranularity: component)
    }

    func compareToNow(withGranularity component: Calendar.Component = .second) -> ComparisonResult {
        return Calendar.current.compare(self, to: Date(), toGranularity: component)
    }
}
