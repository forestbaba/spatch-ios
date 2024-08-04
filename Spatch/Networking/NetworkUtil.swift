//
//  NetworkUtil.swift
//  Spatch
//
//  Created by Adeoy3 on 17/07/2024.
//

import Foundation
import UIKit

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

struct NetworkTestData {
    var session: URLSession!
    var request: URLRequest!
}

protocol NetworkUtil {
    var baseUrl: URL { get }
    var headers: [String: String] { get }
}

struct Response<T: Codable, H: Codable> {
    var body: T
    var header: H
}


enum NHetworkError: Error {
    case noDataReturned
    case noResponse
    case clientError(additionalInfo: [String: Any], headerInfo: [AnyHashable: Any])
    case serverError(additionalInfo: [String: Any])
    case unknownError
    case apiError(message: String)
}

extension NetworkUtil {
    
    var baseUrl: URL {
        return Environment.baseUrl
    }
    
    var appID: String {
        return Environment.appID
    }
    
    var headers: [String: String] {
        var _headers = [String: String]()
        _headers["Accept"] = "/"
        _headers["Content-Type"] = "application/json"
        _headers["X-Lang"] = "en"
        return _headers
    }
    
    func request<T: Codable>(
        url: URL,
        endpoint: String,
        method: HTTPMethod,
        bodyParam: [String: Any]? = nil,
        queryParam: [String: Any]? = nil,
        additionalHeaders: [String: String]? = nil,
        expecting responseType: T.Type,
        authenticate: Bool = true,
        useBasicAuth: Bool = false,
        useDefaultHeaders: Bool = true
    ) async throws -> T {
        var request: URLRequest
        
        if let _queryParam = queryParam {
            print("URLss", url.absoluteString, endpoint)
            var components = URLComponents(string: url.absoluteString + endpoint)!
            components.queryItems = _queryParam.map({ (arg) -> URLQueryItem in
                let (key, value) = arg
                return URLQueryItem(name: key, value: "\(value)")
            })
            components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(
                of: "+", with: "%2B"
            )
            request = URLRequest(url: components.url!)
        } else {
            let components = URLComponents(string: url.absoluteString + endpoint)!

            request = URLRequest(url: components.url!)
            
            if let _bodyParam = bodyParam {
                let jsonData = try JSONSerialization.data(
                    withJSONObject: _bodyParam,
                    options: .prettyPrinted
                )
                request.httpBody = jsonData
            }
        }
        
        request.httpMethod = method.rawValue
        
        if useDefaultHeaders {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        additionalHeaders?.forEach {(request.addValue($0.value, forHTTPHeaderField: $0.key))}
        
        
        let (data, response) = try await URLSession.shared.asyncData(for: request)
        let result = try self.processResponse(
            responseData: data,
            response: response,
            responseType: responseType
        )
        return result
    }
}

private extension NetworkUtil {
    
    func processResponse<T: Codable>(
        responseData: Data?,
        response: URLResponse?,
        responseType: T.Type,
        isTesting: Bool = false
    ) throws -> T {
        
        print("🟡__URL RESPONSE__🟡")
        print(response as Any)
        print("🟢__RESPONSE DATA__🟢")
        print(responseData?.prettyPrintedJSONString as Any)
        print("🟢_________🟢")
        
        guard let data = responseData else {
            throw NetworkError.noDataReturned
        }
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.noResponse
            
        }
        
        let statusCode = response.statusCode
        
        do {
            switch statusCode {
            case 200..<300:
                return try decode(data)
            case 400..<500:
                let payload = try jsonSerializeOrError(data)
                throw NetworkError.clientError(additionalInfo: payload, headerInfo: response.allHeaderFields)
            case 500...:
                let payload = try jsonSerializeOrError(data)
                throw NetworkError.serverError(additionalInfo: payload)
            default:
                throw NetworkError.unknownError
            }
        } catch let error {
            guard statusCode == 204 else { throw error }
            
            let noContent = try JSONSerialization.data(
                withJSONObject: ["status": 204],
                options: .prettyPrinted
            )
            
            return try decode(noContent)
        }
        
    }
    
    func jsonSerializeOrError(_ data: Data) throws -> [String: Any] {
        guard let json = try JSONSerialization.jsonObject(
            with: data, options: []
        ) as? [String: Any] else { throw NetworkError.unknownError }
        
        return json
    }
    
    func decode<T: Codable, H: Codable>(
        _ data: Data,
        headerData: Data,
        dataResponse: T.Type = T.self,
        headerResponse: H.Type? = H.self
    ) throws -> Response<T, H> {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        
        let body = try decoder.decode(T.self, from: data.isEmpty ? JSONEncoder().encode(EmptyResponse()) : data)
        
        let header = try decoder.decode(
            H.self,
            from: headerData.isEmpty ? JSONEncoder().encode(EmptyResponse()) : headerData
        )
        
        let response = Response(body: body, header: header)
        return response
    }
    
    func decode<T: Codable> (_ data: Data) throws -> T {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        
        return try decoder.decode(T.self, from: data.isEmpty ? JSONEncoder().encode(EmptyResponse()) : data)
    }
}


extension Data {
    var rettyPrintedJSONString: NSString? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        
        return prettyPrintedString
    }
}
