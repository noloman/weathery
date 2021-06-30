//
//  OpenWeatherMapApi.swift
//  Weathery
//
//  Created by Manuel Lorenzo (@noloman) on 29/06/2021.
//

import Foundation

enum OpenWeatherMapApi {
    case cityNameSearch(name: String)
}

extension OpenWeatherMapApi: EndpointType {
    var environmentBaseURL : String {
        return "https://api.openweathermap.org"
    }
    
    var baseUrl: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .cityNameSearch:
            // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
            return "/data/2.5/weather"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var httpTask: HTTPTask {
        switch self {
        case .cityNameSearch(name: let name):
            return .requestParameters(bodyParameters: nil, urlParameters: ["q": name, "units": "metric", "APPID": NetworkManager.OpenWeatherMapApiKey])
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
