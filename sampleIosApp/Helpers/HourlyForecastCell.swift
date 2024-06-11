//
//  HourlyForecastCell.swift
//  sampleIosApp
//
//  Created by Softsuave on 10/06/2024.
//

import Foundation
import SwiftUI

struct HourlyForecastCell: View {
    
    var icon: String
    var time: String
    var weather: String
    
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
            .fill(.white)
            .shadow(radius: 10)
            .frame(width: 80, height: 80)
            .overlay {
                VStack {
                    Text(time)
                        .font(.caption)
                    
                    Image(systemName: icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 15)
                    
                    Text(weather)
                        .font(.caption2)
                    
                }
            }
    }
}
