//
//  CGFloatExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09.07.2019.
//

import QuartzCore

public extension CGFloat {

    var degreesInRadians: CGFloat {
        return .pi * self / 180.0
    }

    var radiansInDegrees: CGFloat {
        return 180.0 * self / .pi
    }
}
