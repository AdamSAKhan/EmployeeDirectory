//
//  FakeEmployeeVMManager.swift
//  EmployeeDirectoryTests
//
//  Created by Adam Khan on 19/12/2022.
//
@testable import EmployeeDirectory

import Foundation

class FakeEmployeeVMManager: DataService {
    private var path: String
    init(_ name: String) {
        self.path = name
    }
    
    func getData(from fileName: String) throws -> Data {
        let bundle = Bundle(for: FakeEmployeeVMManager.self)
                
        guard let path =  bundle.url(forResource: self.path, withExtension: "json") else {
            throw DataServiceError.fileNotFound
        }
       return try Data(contentsOf: path)
    }
    
    
}
