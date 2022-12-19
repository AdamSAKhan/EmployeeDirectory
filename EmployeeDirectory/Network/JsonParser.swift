//
//  JsonParser.swift
//  EmployeeDirectory
//
//  Created by MAC on 16/12/22.
//

import Foundation

enum ParserError: Error {
    case parsingFailed
}
protocol JsonParser {
    func decodeJSON<T: Decodable> ( data: Data, type: T.Type) throws -> T
}

extension JsonParser {
    func decodeJSON<T: Decodable> ( data: Data, type: T.Type) throws -> T {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw ParserError.parsingFailed
        }
    }
}
