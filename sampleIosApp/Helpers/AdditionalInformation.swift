//
//  AdditionalInformation.swift
//  sampleIosApp
//
//  Created by Softsuave on 10/06/2024.
//

import Foundation
import SwiftUI

struct AdditionalInformation: View {
    
    var icon: String
    var type: String
    var num: String
    
    var body: some View {
        
        VStack {
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 15)
                .foregroundColor(.blue)
                
            
            Text(type)
            
                
            Text(num)
            
        }.frame(width: 100, height: 100)
            
        
    }
}
