//
//  ViewModel.swift
//  sampleIosApp
//
//  Created by Softsuave on 07/06/2024.
//

import Foundation
import SwiftUI
import Network

final class ViewModel: ObservableObject {
    
    @Published var baseResponse: BaseResponse = BaseResponse()
    
    func refreshDetails(city: String = "bangalore")  {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=24628d9e32ac156d9c1b9f02661cd1b0") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data in response")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode(BaseResponse.self, from: data) {
                DispatchQueue.main.async {
                    print(decodedResponse)
                    self.baseResponse = decodedResponse
                }
            } else {
                print("Failed to decode JSON")
            }
        }.resume()
        
    }
}
