//
//  Job.swift
//  CriandoPrimeiroMockMasterCode
//
//  Created by Caio Fabrini on 06/04/26.
//

import Foundation

// MARK: - Job
struct Job: Codable {
    let id: Int
    let title: String
    let company: Company
    let description, employmentType, experienceLevel: String
    let salary: Salary
    let requirements: Requirements
    let benefits: Benefits
    let recruiter: Recruiter
    let application: Application
    let project: Project
    let metadata: Metadata
}

// MARK: - Application
struct Application: Codable {
    let deadline: String
    let applicationURL: String
    let documentsRequired, steps: [String]

    enum CodingKeys: String, CodingKey {
        case deadline
        case applicationURL = "applicationUrl"
        case documentsRequired, steps
    }
}

// MARK: - Benefits
struct Benefits: Codable {
    let healthInsurance, dentalInsurance, mealVoucher, transportVoucher: Bool
    let gymPass, annualBonus: Bool
    let paidVacationDays: Int
}

// MARK: - Company
struct Company: Codable {
    let name, industry: String
    let website: String
    let email, phone: String
    let location: Location
}

// MARK: - Location
struct Location: Codable {
    let country, state, city, address: String
    let zipCode: String
    let isRemote: Bool
}

// MARK: - Metadata
struct Metadata: Codable {
    let postedAt, updatedAt: String
    let isActive: Bool
    let jobCode, priority: String
}

// MARK: - Project
struct Project: Codable {
    let name: String
    let teamSize: Int
    let methodology: String
    let sprintDurationInWeeks: Int
    let currentPhase: String
    let responsibilities: [String]
}

// MARK: - Recruiter
struct Recruiter: Codable {
    let name, position, email, phone: String
}

// MARK: - Requirements
struct Requirements: Codable {
    let minimumExperienceInYears: Int
    let educationLevel, englishLevel: String
    let technologies, softSkills: [String]
}

// MARK: - Salary
struct Salary: Codable {
    let currency: String
    let min, max: Int
    let isNegotiable: Bool
}
