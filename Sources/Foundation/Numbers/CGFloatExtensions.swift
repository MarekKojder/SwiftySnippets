//
//  CGFloatExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09.07.2019.
//

//#if canImport(QuartzCore)
import QuartzCore

public extension CGFloat {

    ///Current value in degrees converted to radians.
    var degreesInRadians: CGFloat {
        return .pi * self / 180.0
    }

    ///Current value in radians converted to degrees.
    var radiansInDegrees: CGFloat {
        return 180.0 * self / .pi
    }
}
//#endif
