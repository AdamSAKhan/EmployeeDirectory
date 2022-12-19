//
//  JSONDecodeTest.swift
//  EmployeeDirectoryTests
//
//  Created by Adam Khan on 19/12/2022.
//

import XCTest
@testable import EmployeeDirectory

final class EmployeeDirectoryJSONTests: XCTestCase, JsonParser {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    let numberOfEmployees: Int = 11
    
    var employeesViewModel: EmployeesViewModel = EmployeesViewModel(dataServiceManager: FakeEmployeeVMManager("EmployeesTest"))
    
    func testTheJsonParserCount() {
        employeesViewModel.getEmloyees()
        XCTAssertEqual(11, employeesViewModel.employees.count)
    }
    
}
