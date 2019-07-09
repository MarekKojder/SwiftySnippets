//
//  ArrayExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09.07.2019.
//

import Foundation

public extension Collection {
    
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

public extension Array where Iterator.Element: Equatable {

    typealias MergingHandler = (_ existing: Element, _ appending: Element) -> Element
    typealias ModifyingHandler = (_ element: Element) -> Element

    internal func filterDuplicates(_ merge: MergingHandler, else modify: ModifyingHandler?) -> [Element] {
        var results = [Element]()
        forEach { (element) in
            if let index = results.firstIndex(where: { element == $0 }) {
                results[index] = merge(results[index], element)
            } else if let modifiedElement = modify?(element) {
                results.append(modifiedElement)
            }
        }
        return results
    }
}
