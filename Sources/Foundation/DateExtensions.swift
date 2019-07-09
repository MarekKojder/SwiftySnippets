//
//  DateExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09.07.2019.
//

import Foundation

public extension Date {

    /**
     Compares two dates down to the specified component.

     - Parameters:
       - date: A date to compare.
       - component: A granularity to compare. For example, pass .hour to check if two dates are in the same hour.

     - Returns: .orderedSame if the two dates are equal in the given component and all larger components; otherwise, either .orderedAscending or .orderedDescending.
     */
    func compare(to date: Date, withGranularity component: Calendar.Component = .second) -> ComparisonResult {
        return Calendar.current.compare(self, to: date, toGranularity: component)
    }

    /**
     Compares the date to now down to the specified component.

     - Parameters:
       - component: A granularity to compare. For example, pass .hour to check if two dates are in the same hour.

     - Returns: .orderedSame if the two dates are equal in the given component and all larger components; otherwise, either .orderedAscending or .orderedDescending.
     */
    func compareToNow(withGranularity component: Calendar.Component = .second) -> ComparisonResult {
        return Calendar.current.compare(self, to: Date(), toGranularity: component)
    }
}
