//
//  ContentView.swift
//  OpenWeahter(SwiftUI)
//
//  Created by 김도경 on 12/7/23.
//

import SwiftUI
import Alamofire



struct ContentView: View {
    
    let url = "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=\(APIKey.key.rawValue)"
        
    var weather : WeatherModel?
    
    @State var currentWeather  = ""
    @State var currentTemp = ""
    @State var currentHumidity = ""
    
    var body: some View {
        VStack {
            Text("오늘의 날씨!")
                .font(.title).bold()
            Text(currentWeather)
            Text(currentTemp)
            Text(currentHumidity)
            Button(action: {
                getWeather()
            }, label: {
                Text("날씨 체크")
                    
            })
        }
        .padding()
        .onAppear{
            getWeather()
        }
    }
    
    func getWeather(){
        AF.request(url)
                    .responseDecodable(of:WeatherModel.self) { response in
                                switch response.result {
                                case .success(let result):
                                    self.currentWeather = "Current weather is  \(result.weather[0].main)"
                                    self.currentTemp = "The temperature is \(result.main.temp) F"
                                    self.currentHumidity = "The humidity is 73"
                                case .failure(let error):
                                    print(error.localizedDescription, error)
                                }
                        }

    }
}

#Preview {
    ContentView()
}
