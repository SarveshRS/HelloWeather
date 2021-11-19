//
//  HomeModel.swift
//  HelloWeather
//
//  Created by Sarvesh Suryavanshi on 19/11/21.
//

import Foundation

class HomeModel {
    
}

extension HomeModel: HomeModelProtocol {
    
    func fetchWeather(for place: Place, completion: @escaping (WeatherModel?) -> Void) {
        
        NetworkClient.loadAndParse(request: API.currentWeather(place.name).rawValue,
                                   outputType: WeatherModel.self) { result in
            switch result {
            case .success(let weather):
                print(weather)
                completion(weather)
            default:
                completion(nil)
            }
        }
    }
    
    func fetchWeatherForecase(for place: Place, days: Int, completion: @escaping (WeatherModel?) -> Void) {
        
        NetworkClient.loadAndParse(request: API.forecase(place.name, days).rawValue,
                                   outputType: WeatherModel.self) { result in
            switch result {
            case .success(let weather):
                print(weather)
                completion(weather)
            default:
                completion(nil)
            }
        }
    }
    
    func fetchSearchResults(searchText: String, completion: @escaping ([Place]?) -> Void) {
        
        if searchText.count > 3 {
            NetworkClient.loadAndParse(request: API.search(searchText).rawValue,
                                       outputType: [Place].self) { result in
                switch result {
                case .success(let searchResult):
                    print(searchResult)
                    completion(searchResult)
                default:
                    completion(nil)
                }
            }
        }
    }
}