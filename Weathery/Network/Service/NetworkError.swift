//
//  NetworkError.swift
//  Weathery
//
//  Created by Manuel Lorenzo (@noloman) on 29/06/2021.
//

import Foundation

enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil"
    case encodingFailed = "Parameter encoding failed"
    case missingUrl = "URL is nil"
}
