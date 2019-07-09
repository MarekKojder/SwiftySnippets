//
//  FloatingPointExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09.07.2019.
//

import Foundation

public extension FloatingPoint {

    /// Returns a random floating point number between 0.0 and 1.0, inclusive.
    static var random: Self {
        return Self(arc4random()) / 0xFFFFFFFF
    }

    /**
     Random value between 0 and n-1.

     - Parameters:
       - min: Minimum random number
       - max: Maximum random number

     - Returns: Returns a random double point number between min and max
     */
    static func random(min: Self, max: Self) -> Self {
        return random * (max - min) + min
    }

    /**
     Rounds floating point number.

     - Parameter digit: Number of decimal places to round.

     - Returns: Returns number rounded to given given number of decimal places.
     */
    func rounded(to digit: UInt) -> Self {
        var multipler = 1
        for _ in 0..<digit {
            multipler *= 10
        }
        let value = Self(multipler) * self
        return value.rounded() / Self(multipler)
    }
}
