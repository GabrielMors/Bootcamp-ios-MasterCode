//
//  StudentElement.swift
//  CriandoPrimeiroMockMasterCode
//
//  Created by Caio Fabrini on 06/04/26.
//

import Foundation

// MARK: - Student
struct Student: Codable {
    let id: Int
    let name: String
    let age: Int
    let email, phone, city: String
    let isEnrolled: Bool
    let finalGrade: Double
    let course: String
    let shift: Shift
}

enum Shift: String, Codable {
    case afternoon = "Afternoon"
    case evening = "Evening"
    case morning = "Morning"
}

typealias StudentList = [Student]
