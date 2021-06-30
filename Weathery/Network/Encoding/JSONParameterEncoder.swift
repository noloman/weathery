//
//  JSONParameterEncoder.swift
//  Weathery
//
//  Created by Manuel Lorenzo (@noloman) on 29/06/2021.
//

import Foundation

struct JSONParameterEncoder: ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with paramers: Parameters) throws {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: paramers, options: .prettyPrinted)
            urlRequest.httpBody = jsonData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}
