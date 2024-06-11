//
//  CityData.swift
//  sampleIosApp
//
//  Created by Softsuave on 07/06/2024.
//

import Foundation

struct BaseResponse: Codable {
    var cod: String?
    var message: Int?
    var cnt: Int = 0
    var list: [HourlyForecast]?
    var city: City?
    
}

struct HourlyForecast: Codable {
    var weather: [Weather]
    var main: MainData?
    var wind: WindData?
    
}

struct Weather: Codable {
    var main: String?
    var description: String?
    var icon: String?
}

struct MainData: Codable {
    var temp: Double?
    var pressure: Int?
    var humidity: Int?
}

struct City: Codable {
    var name: String?
    var country: String?
}

struct WindData: Codable {
    var speed: Double?
}
