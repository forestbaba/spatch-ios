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
                        print("Unknown error: \(error.localizedDescription)")
                    }
                }
    }
}
