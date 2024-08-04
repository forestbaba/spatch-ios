//
//  AuthClient.swift
//  Spatch
//
//  Created by Adeoy3 on 17/07/2024.
//

import Foundation

protocol AuthClientProtocol {
    
    func login(email: String, password: String, fcm: String) async throws -> LoginResponse
}

class AuthClient: AuthClientProtocol, NetworkUtil {
    func login(email: String, password: String, fcm: String) async throws -> LoginResponse {
        let url = baseUrl
        return try await self.request(
            url: url, endpoint: "/login",
            method: .post,
            bodyParam: ["email" : email, "password": password, "fcm": fcm], expecting: LoginResponse.self)
    }
    
    
}
