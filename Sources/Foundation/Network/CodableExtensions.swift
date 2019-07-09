//
//  CodableExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09.07.2019.
//

import Foundation

public extension Decodable {

    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }

    /**
     Returns an object, decoded from a JSON object.

     - Parameters:
       - data: The JSON object to decode.
     */
    static func decode(from data: Data) throws -> Self {
        return try decoder.decode(Self.self, from: data)
    }
}

public extension Encodable {

    var encoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .secondsSince1970
        return encoder
    }

    ///Returns a JSON-encoded representation of the object.
    func encoded() throws -> Data {
        return try encoder.encode(self)
    }
}
