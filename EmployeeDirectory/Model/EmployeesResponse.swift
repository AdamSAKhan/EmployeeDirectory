//
//  EmployeesResponse.swift
//  EmployeeDirectory
//
//  Created by MAC on 16/12/22.
//

import Foundation

// MARK: - EmployeesResponse
struct EmployeesResponse: Decodable {
    let employees: [Employee]
}

// MARK: - Employee
struct Employee: Decodable, Identifiable {
    var id = UUID()
    
    let uuid, fullName, phoneNumber, emailAddress: String
    let biography: String
    let photoURLSmall, photoURLLarge: String
    let team: String
    let employeeType: EmployeeType

    enum CodingKeys: String, CodingKey {
        case uuid
        case fullName = "full_name"
        case phoneNumber = "phone_number"
        case emailAddress = "email_address"
        case biography
        case photoURLSmall = "photo_url_small"
        case photoURLLarge = "photo_url_large"
        case team
        case employeeType = "employee_type"
    }
}

enum EmployeeType: String, Decodable {
    case contractor = "CONTRACTOR"
    case fullTime = "FULL_TIME"
    case partTime = "PART_TIME"
}
