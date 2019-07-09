//
//  NSObjectExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09.07.2019.
//

import Foundation

public extension NSObject {

    static var typeName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }

    var typeName: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last ?? ""
    }
}
