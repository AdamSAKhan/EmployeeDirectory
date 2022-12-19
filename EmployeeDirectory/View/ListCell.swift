//
//  ListCell.swift
//  EmployeeDirectory
//
//  Created by Adam Khan on 19/12/2022.
//

import SwiftUI

internal struct ListCell: View {
    let name: String
    let job: String
    let image: String
    let key: String
    var body: some View {
        HStack{
            ListImageLHS(url: image, key: key).padding()
            ListTextRHS(employeeName: name, employeeTeam: job)
        }
        .frame(maxWidth: .infinity, maxHeight: 120)
//        .padding()
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(name: "Tom", job: "IT", image: "https://s3.amazonaws.com/sq-mobile-interview/photos/43ed39b3-fbc0-4eb8-8ed3-6a8de479a52a/small.jpg", key: "kjkj")
    }
}
