//
//  ListTextRHS.swift
//  EmployeeDirectory
//
//  Created by Adam Khan on 19/12/2022.
//

import SwiftUI

internal struct ListTextRHS: View {
    let employeeName: String
    let employeeTeam: String
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("Name: " + employeeName)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Team: " + employeeTeam)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 120)
    }
}

struct ListTextRHS_Previews: PreviewProvider {
    static var previews: some View {
        ListTextRHS(employeeName: "Tom", employeeTeam: "IT")
    }
}
