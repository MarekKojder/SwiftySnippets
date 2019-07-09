//
//  TimeIntervalExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09.07.2019.
//

import Foundation

public extension TimeInterval {

    static var minute: TimeInterval {
        return 60
    }

    static var hour: TimeInterval {
        return 60 * minute
    }

    static var day: TimeInterval {
        return 24 * hour
    }

    static var week: TimeInterval {
        return 7 * day
    }

    //TODO: Improve this
    /// Takes seconds and returns time string in format:
    /// -less than 60 minutes -> mm:ss
    /// -more than 60 minutes -> hh:mm:ss
    var timeString: String? {
        guard !self.isNaN && !self.isInfinite else { return nil }

        let formatter = DateComponentsFormatter()
        var prefix = ""
        formatter.unitsStyle = .positional
        if self < 3600 {
            formatter.zeroFormattingBehavior = .pad
            formatter.allowedUnits = [.minute, .second]
            if self < 600 {
                prefix = "0"
            }
        } else {
            formatter.zeroFormattingBehavior = .default
            formatter.allowedUnits = [.hour, .minute, .second]
            if self < 36000 {
                prefix = "0"
            }
        }
        guard let timeString = formatter.string(from: self) else { return nil }
        return prefix + timeString
    }
}

