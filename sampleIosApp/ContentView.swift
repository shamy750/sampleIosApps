//
//  ContentView.swift
//  sampleIosApp
//
//  Created by Softsuave on 07/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var search: String = ""
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.blue,.white], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack {
                        VStack {
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(.white)
                                .opacity(0.50)
                                .shadow(radius: 10)
                                .frame(height: 50,alignment: .center)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                                .overlay {
                                    HStack {
                                        Image(systemName: "magnifyingglass.circle.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 25)
                                            .padding()
                                        TextField("Enter Location", text: $search)
                                            .onSubmit {
                                                viewModel.refreshDetails(city: search)
                                            }
                                    }
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                                }
                            Text(viewModel.baseResponse.city?.name ?? "")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding()
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(.blue)
                                .frame(height: 150)
                                . shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x:5, y:5)
                                .padding(.bottom, 10)
                                .overlay {
                                    VStack(spacing: 5) {
                                        Text("\(viewModel.baseResponse.list?[0].main?.temp ?? 0, specifier: "%.2f")K")
                                            .font(.title)
                                        
                                        Image(systemName: getIcon(icon: viewModel.baseResponse.list?[0].weather[0].icon ?? ""))
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 35)
                                        
                                        Text(viewModel.baseResponse.list?[0].weather[0].description ?? "")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                        
                                    }
                                }.foregroundColor(.white)
                            
                            VStack {
                                Text("Weather Forecast")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .fontWeight(.bold)
                                    .padding(.top, 10)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(0...25, id: \.self) { index in
                                            let weatherData = viewModel.baseResponse.list?[index + 1]
                                            HourlyForecastCell(icon: getIcon(icon: weatherData?.weather[0].icon ?? ""), time: "Monday", weather: weatherData?.weather[0].description ?? "")
                                            
                                        }
                                    }
                                    
                                    
                                }
                            }
                            
                            Text("Additional Information")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding(.top, 10)
                            
                            HStack {
                                let weatherData = viewModel.baseResponse.list?[0]
                                
                                AdditionalInformation(icon: getIcon(icon: weatherData?.weather[0].icon ?? ""), type:"Humidity", num:"\(weatherData?.main?.humidity ?? 0)" )
                                AdditionalInformation(icon: getIcon(icon: weatherData?.weather[0].icon ?? ""), type: "Pressure", num:"\(weatherData?.main?.pressure ?? 0)" )
                                AdditionalInformation(icon: getIcon(icon: weatherData?.weather[0].icon ?? ""), type: "Wind Speed", num:"\(weatherData?.wind?.speed ?? 0)" )
                                
                            }
                            .frame(height: 110)
                            
                            
                        }
                    }
                    .safeAreaPadding()
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Weather App")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            
                            
                        }
                        ToolbarItem (placement: .automatic) {
                            Button {
                                viewModel.refreshDetails()
                            }label: {
                                Image(systemName: "arrow.circlepath")
                                
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                
                            }
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarBackground(Color.blue, for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                }
                
            }
            
        }
        .onAppear {
            viewModel.refreshDetails()
        }
    }
    
    
    func getIcon(icon: String) -> String {
        switch (icon) {
            
        case "01d":
            return "sun.max.fill";
        case "01n":
            return "moon.zzz";
        case "02d":
            return "cloud";
        case "02n":
            return "cloud";
        case "03d":
            return "cloud.sun.fill";
        case "03n":
            return "cloud.moon.fill";
        case "04d":
            return "cloud.snow.fill";
        case "04n":
            return "cloud.snow.fill";
            
        case "09d":
            return "cloud.snow.fill";
        case "09n":
            return "cloud.snow.fill";
        case "11d":
            return "cloud.sun.bolt";
        case "11n":
            return "cloud.moon.bolt";
        case "13d":
            return "sun.snow.fill";
        case "13n":
            return "cloud.snow.fill";
        case "15d":
            return "cloud.fog";
        case "15n":
            return "cloud.fog";
        default:
            return "cloud.sun.rain.circle.fill";
        }
    }
}

#Preview {
    ContentView()
}
