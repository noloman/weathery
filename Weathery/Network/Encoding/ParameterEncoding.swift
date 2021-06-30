//
//  ParameterEncoding.swift
//  Weathery
//
//  Created by Manuel Lorenzo (@noloman) on 29/06/2021.
//

import Foundation

public typealias Parameters = [String:Any]

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
