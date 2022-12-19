//
//  EmployeesViewModelTest.swift
//  EmployeeDirectoryTests
//
//  Created by Adam Khan on 19/12/2022.
//

import XCTest
@testable import EmployeeDirectory

final class EmployeesViewModelTest: XCTestCase {

    private var fakeEmployeeVMManager: DataService?
    
    override func setUpWithError() throws {
        self.fakeEmployeeVMManager = FakeEmployeeVMManager("EmployeesTest")
    }

    override func tearDownWithError() throws {
        self.fakeEmployeeVMManager = nil
    }
    func testGetEmloyees() {
        self.fakeEmployeeVMManager = FakeEmployeeVMManager("EmployeesTest")
        guard let fakeNWManager = fakeEmployeeVMManager else { return }
        let employeeVM = EmployeesViewModel(dataServiceManager: fakeNWManager)
        employeeVM.getEmloyees()
        XCTAssertEqual(11, employeeVM.employees.count)
    }
    
    func testGetEmloyees_ErrorIsNil() {
        self.fakeEmployeeVMManager = FakeEmployeeVMManager("")
        guard let fakeNWManager = fakeEmployeeVMManager else { return }
        let employeeVM = EmployeesViewModel(dataServiceManager: fakeNWManager)
        employeeVM.getEmloyees()
        XCTAssertFalse(employeeVM.showAlert) 
    }

}
