//
//  WeatherView.swift
//  weatherApp
//
//  Created by Onur Şimşek on 5.08.2022.
//

import SwiftUI


struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading){
            
            VStack {
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                        
                        
                    
                    Text("Today,\(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)

                }
                .frame(maxWidth:.infinity,alignment: .leading)
                Spacer()
                VStack{
                    HStack{
                        VStack(spacing:20){
                            Image(systemName: "sun.max.fill")
                                .font(.system(size: 70))
                                .foregroundColor(Color.yellow)
                            Text(weather.weather[0].main)
                        }
                        .frame(width:150,alignment: .leading)
                        Text(weather.main.feelsLike.roundDouble()+"°")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .padding()
                            
                    }
                    Spacer()
                        .frame(height:80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 350)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        
                                        Spacer()
                    
                }
                .frame(maxWidth:.infinity)
            }
            .padding()
            .frame(maxWidth:.infinity,alignment: .leading)
            VStack {
                           Spacer()
                           VStack(alignment: .leading, spacing: 20) {
                               Text("Weather now")
                                   .bold()
                                   .padding(.bottom)
                               
                               HStack {
                                   WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + ("°")))
                                   Spacer()
                                   WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                               }
                               
                               HStack {
                                   WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                                   Spacer()
                                   WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                               }
                           }
                           .frame(maxWidth: .infinity, alignment: .leading)
                           .padding()
                           .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                           .background(.white)
                           .padding(.bottom,20)
                           

                           
                          
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color("AccentColor"))
        .preferredColorScheme(.dark)

        
       
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
}
