//
//  Auth.swift
//  Spatch
//
//  Created by Adeoy3 on 17/07/2024.
//

import Foundation

// MARK: - LoginResponse
struct LoginResponse: Codable {
    let success: Bool
    let data: LoginResponseData?
}

// MARK: - LoginResponseData
struct LoginResponseData: Codable {
    let token, tokenType: String
    let user: User

    enum CodingKeys: String, CodingKey {
        case token
        case tokenType = "token_type"
        case user
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let firstname, lastname, email, phone: String
    let avatar: String
    let verified: Bool
    let fcmKey: String
    let expiresIn: Int

    enum CodingKeys: String, CodingKey {
        case id, firstname, lastname, email, phone, avatar, verified
        case fcmKey = "fcm_key"
        case expiresIn = "expires_in"
    }
}
