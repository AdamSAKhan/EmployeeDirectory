//
//  DataServiceManager.swift
//  EmployeeDirectory
//
//  Created by MAC on 16/12/22.
//

import Foundation

enum DataServiceError: Error {
    case fileNotFound
}
protocol DataService {
    func getData(from fileName: String) throws ->  Data
}
class DataServiceManager: DataService {
    func getData(from fileName: String) throws -> Data {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            throw DataServiceError.fileNotFound
        }
       return try Data(contentsOf: url)
    }
}
