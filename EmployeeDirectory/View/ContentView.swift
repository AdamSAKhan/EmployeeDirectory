//
//  ContentView.swift
//  EmployeeDirectory
//
//  Created by MAC on 16/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: EmployeesViewModel = EmployeesViewModel(dataServiceManager: DataServiceManager())
    @State private var presentAlert = false

    var body: some View {
        List {
            ForEach(viewModel.employees) { employee in
                VStack(alignment: .leading) {
                    ListCell(name: employee.fullName, job: employee.team, image: employee.photoURLLarge, key: employee.uuid)
                }
            }
        }
        .refreshable(action: {
            viewModel.employees = []
            viewModel.getEmloyees()
        })
        .onAppear{ viewModel.getEmloyees() }
        .alert("Something went wrong, Please try again!", isPresented: $viewModel.showAlert) {
                    Button("OK", role: .cancel) { }
                }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(viewModel: EmployeesViewModel(dataServiceManager: DataServiceManager()))
//    }
//}

