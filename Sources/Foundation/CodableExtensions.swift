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

    func encoded() throws -> Data {
        return try encoder.encode(self)
    }
}
