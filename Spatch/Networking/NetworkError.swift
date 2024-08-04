//
//  NetworkError.swift
//  Spatch
//
//  Created by Adeoy3 on 17/07/2024.
//

import Foundation

enum NetworkError: Error {
    
    case clientError(additionalInfo: [String: Any]?, headerInfo: [AnyHashable: Any]?)
    case serverError(additionalInfo: [String: Any]?)
    case unknownError
    case noDataReturned
    case noResponse
    case apiError(message: String)

    
    var reason: String {
        switch self {
        case .clientError:
            return "A client error occurred while processing request"
        case .serverError:
            return "Server errors occurred while processing request"
        case .unknownError:
            return "An unknown error occurred while fetching data"
        case .noDataReturned:
            return "An error occurred while fetching data"
        case .noResponse:
            return "No response returned from server"
        case .apiError(message: let message):
            return "Full blown server error"

        }
    }
}
