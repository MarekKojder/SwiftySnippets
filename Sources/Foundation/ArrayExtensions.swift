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

    /**
     Removes duplicates from array and allows to modify every unique element.

     - Parameters:
       - merge: Block of code responsible for merging duplicates.
       - modify: Allows to modify element which did not has duplicate.

     - Returns: Array without duplicates.
     */
    func filterDuplicates(_ merge: MergingHandler, else modify: ModifyingHandler? = nil) -> [Element] {
        var results = [Element]()
        forEach { element in
            if let index = results.firstIndex(where: { element == $0 }) {
                results[index] = merge(results[index], element)
            } else {
                results.append(modify?(element) ?? element)
            }
        }
        return results
    }
}
