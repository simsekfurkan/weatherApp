//
//  ContentView.swift
//  weatherApp
//
//  Created by Furkan Şimşek on 5.08.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack{
            
            if let location = locationManager.location{
                if let weather = weather {
                    WeatherView(weather: weather)                } else {
                    LoadingView()
                        .task {
                            do {
                               weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch  {
                                print("Eror getting weather\(error)")
                            }
                        }
                }
                     } else{
                    if locationManager.isloading{
                        ProgressView()
                    }else{
                        WelcomeView()
                            .environmentObject(locationManager)
                    }
                }
            
            
            
        }
        .background(Color("AccentColor"))
        
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
