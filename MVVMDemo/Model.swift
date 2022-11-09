//
//  Model.swift
//  MVVMDemo
//
//  Created by Capgemini-DA078 on 07/11/22.
//

import UIKit
// MARK: Employee
struct Employees: Decodable {
    let status : String
    let Data: [EmployeeData]
}

  // MARK : EmployeeData
struct EmployeeData: Decodable {
    let id, employeeName, employeeSalary, employeeAge: String
    let profileImage: String
    
    enum CodeKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_Saraly"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
