//
//  NetworkManager.swift
//  Weathery
//
//  Created by Manuel Lorenzo (@noloman) on 29/06/2021.
//

import Foundation

struct NetworkManager {
    static let OpenWeatherMapApiKey = "c4c4e1285a033c02fe48aa9fc3b24e6a"
    let router = Router<OpenWeatherMapApi>()
    
    enum Result<String>{
        case success
        case failure(String)
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}

extension NetworkManager: OpenWeatherMapApiEndpoints {
    func getLocation(name: String, completion: @escaping (CurrentWeatherDataForLocationBase?, String?) -> ()) {
        router.request(.cityNameSearch(name: name)) { data, response, error in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
                        let apiResponse = try JSONDecoder().decode(CurrentWeatherDataForLocationBase.self, from: responseData)
                        completion(apiResponse, nil)
                    } catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
}
