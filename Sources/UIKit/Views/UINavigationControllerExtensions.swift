//
//  UINavigationControllerExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 19/07/2019.
//

import UIKit

public extension UINavigationController {

    private var titleTextAttributes: [NSAttributedString.Key: Any] {
        return navigationBar.titleTextAttributes ?? [NSAttributedString.Key: Any]()
    }

    /**
     Sets title color.

     - Parameters:
       - color: Color for title.
     */
    func setTitle(_ color: UIColor) {
        var attributes = titleTextAttributes
        attributes[.foregroundColor] = color
        navigationBar.titleTextAttributes = attributes
    }

    /**
     Sets title font.

     - Parameters:
       - font: Font for title.
     */
    func setTitle(_ font: UIFont) {
        var attributes = titleTextAttributes
        attributes[.font] = font
        navigationBar.titleTextAttributes = attributes
    }

    ///Hides navigation bar bottom line.
    func hideNavigationBarShadow() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
    }
}
