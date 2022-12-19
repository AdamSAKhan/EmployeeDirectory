//
//  EmployeesViewModel.swift
//  EmployeeDirectory
//
//  Created by MAC on 16/12/22.
//

import Foundation

final class EmployeesViewModel: ObservableObject, JsonParser {
  
    private let dataServiceManager: DataService
    @Published var employees: [Employee] = []
    @Published var showAlert: Bool = false

    init(dataServiceManager: DataService) {
        self.dataServiceManager = dataServiceManager
    }
    
    func getEmloyees() {
        do {
            let data =  try dataServiceManager.getData(from: "employees")
            self.employees = try decodeJSON(data: data, type: EmployeesResponse.self).employees
            self.employees.sort{$0.team<$1.team}
        }catch {
            // handle error
            //Showing Error Alert
            self.showAlert = true
        }
    }
    
}


