//
//  ApiError.swift
//  Spatch
//
//  Created by Adeoy3 on 25/07/2024.
//

import Foundation

//// MARK: - APiError
//struct ApiError: Codable, Error {
//    let message: String?
//    let statusCode: Int?
//    let debug: Debug?
//
//    enum CodingKeys: String, CodingKey {
//        case message
//        case statusCode = "status_code"
//        case debug
//    }
//}
//
//// MARK: - Debug
//struct Debug: Codable {
//    let line: Int
//    let file, debugClass: String
//    let trace: [String]
//
//    enum CodingKeys: String, CodingKey {
//        case line, file
//        case debugClass = "class"
//        case trace
//    }
//}

// MARK: - Welcome
struct ApiError: Codable {
    let message: String
    let errors: Errors
    let statusCode: Int

    enum CodingKeys: String, CodingKey {
        case message, errors
        case statusCode = "status_code"
    }
}

// MARK: - Errors
struct Errors: Codable {
    let email: [String]
}
