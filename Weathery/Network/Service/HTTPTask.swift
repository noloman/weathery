//
//  HttpTask.swift
//  Weathery
//
//  Created by Manuel Lorenzo (@noloman) on 29/06/2021.
//

typealias HTTPHeaders = [String: String]

enum HTTPTask {
    case request
    case requestParameters(bodyParameters: Parameters?, urlParameters: Parameters?)
    case requestParametersAndHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, additionalParameters: HTTPHeaders?)
}
