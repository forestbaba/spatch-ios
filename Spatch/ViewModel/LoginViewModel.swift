//
//  LoginViewModel.swift
//  Spatch
//
//  Created by Adeoy3 on 17/07/2024.
//

import Foundation
import Combine

class LoginViewModel {
    let client: AuthClient
    var data = CurrentValueSubject<LoginResponseData?, Never>(nil)
    var loginError = PassthroughSubject<[String], Never>()
    var noInternetError = PassthroughSubject<Void, Never>()
    
    init(client: AuthClient) {
        self.client = client
    }
    
    func login(email: String, password: String, fcm: String) {
        Task {
            do {
                let req = try await client.login(email: email, password: password, fcm: fcm)
                if let res = req.data {
                    data.send(res)
                    print("===PUT ONE STRING====", res)
                } else {
                    // Handle the case where data is nil
                    print("No data received")
                }
            } catch {
                handleError(error: error)
            }
        }
    }
    
    func handleError(error: Error) {
        DispatchQueue.main.async {[weak self] in
            guard let networkError = error as? NetworkError else {
                self?.noInternetError.send(())
                return
            }
            switch networkError {
            case .clientError(let errors, _):
                let message = errors?["message"] as? String
                let statusCode = errors?["status_code"] as? Int
                if statusCode == 401 {
                    guard let message else { return }
                    self?.loginError.send([message])
                } else {
                    let item = errors?["errors"] as? [String: Any]
                    let email = item?["email"] as? [String]
                    guard let self, let email else { return }
                    self.loginError.send(email)
                }
            default:
                break
            }
        }
    }
}
