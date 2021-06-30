//
//  EndpointType.swift
//  Weathery
//
//  Created by Manuel Lorenzo (@noloman) on 29/06/2021.
//

import Foundation

protocol EndpointType {
    var baseUrl: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var httpTask: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
