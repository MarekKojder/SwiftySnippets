//
//  TimeIntervalExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09.07.2019.
//

import Foundation

public extension TimeInterval {

    ///Number of seconds in minute.
    static var minute: TimeInterval {
        return 60
    }

    ///Number of seconds in hour.
    static var hour: TimeInterval {
        return 60 * minute
    }

    ///Number of seconds in day.
    static var day: TimeInterval {
        return 24 * hour
    }

    ///Number of seconds in week.
    static var week: TimeInterval {
        return 7 * day
    }

    /**
     Converts current value to time string.

     - Parameters:
       - style: The formatting style for unit names. The default value is `positional`.

     - Returns: TimeInterval formated to time string.

     This method always leaves minutes and seconds even if time interval is less than one second.
     */
    func timeString(style: DateComponentsFormatter.UnitsStyle = .positional) -> String? {
        guard !isNaN, !isInfinite else {
            return nil
        }
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        if self < TimeInterval.hour {
            formatter.zeroFormattingBehavior = .pad
            formatter.allowedUnits = [.minute, .second]
        } else {
            formatter.zeroFormattingBehavior = .default
            formatter.allowedUnits = [.day, .hour, .minute, .second]
        }
        return formatter.string(from: self)
    }
}

