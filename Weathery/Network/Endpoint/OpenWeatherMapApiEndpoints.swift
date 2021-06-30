//
//  OpenWeatherMapApiEndpoints.swift
//  Weathery
//
//  Created by Manuel Lorenzo (@noloman) on 29/06/2021.
//

import Foundation

protocol OpenWeatherMapApiEndpoints {
    func getLocation(name: String, completion: @escaping (_ location: CurrentWeatherDataForLocationBase?,_ error: String?) -> ())
}
