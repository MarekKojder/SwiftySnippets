//
//  URLExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09.07.2019.
//

import Foundation

public extension URL {

    ///Allows to initiate URL with optional string.
    init?(string: String?) {
        guard let string = string else {
            return nil
        }
        self.init(string: string)
    }

    /**
     Creates url with added query components.

     - Parameters:
       - queryComponents: Components to add to the URL.

     - Returns: URL with given components.
     */
    func appendingQueryComponents(_ queryComponents: [(name: String, value: String)]) -> URL? {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            return nil
        }
        var items = components.queryItems ?? []
        queryComponents.forEach { items.append(URLQueryItem(name: $0.name, value: $0.value)) }
        components.queryItems = items
        return components.url
    }
}
