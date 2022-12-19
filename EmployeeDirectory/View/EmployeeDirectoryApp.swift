//
//  EmployeeDirectoryApp.swift
//  EmployeeDirectory
//
//  Created by MAC on 16/12/22.
//

import SwiftUI

@main
struct EmployeeDirectoryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: EmployeesViewModel(dataServiceManager: DataServiceManager()))
        }
    }
}
