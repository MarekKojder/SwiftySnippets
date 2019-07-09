//
//  NSObjectExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09.07.2019.
//

import Foundation

public extension NSObject {

    ///A string corresponding to the name of the class.
    static var typeName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }

    ///A string corresponding to the name of the class of object.
    var typeName: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last ?? ""
    }
}
