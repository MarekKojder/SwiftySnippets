//
//  UIColorExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 19/07/2019.
//

import UIKit

public extension UIColor {

    private convenience init(red: Int, green: Int, blue: Int, a: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(a) / 255.0)
    }

    /**
     Initializes and returns a color object using the specified HEX value.

     - Parameters:
       - rgb: HEX value of color eg. 0xFFFFFF
     */
    convenience init(rgb: Int) {
        self.init(red:(rgb >> 16) & 0xff, green:(rgb >> 8) & 0xff, blue:rgb & 0xff, a: 0xff)
    }

    /**
     Initializes and returns a color object using the specified HEX value including alpha.

     - Parameters:
       - rgba: HEX value of color and alpha eg. 0xFFFFFF0A
     */
    convenience init(rgba: Int) {
        self.init(red: (rgba >> 24) & 0xff, green: (rgba >> 16) & 0xff, blue: (rgba >> 8) & 0xff, a: rgba & 0xff)
    }
}
