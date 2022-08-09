//
//  WelcomeView.swift
//  weatherApp
//
//  Created by Onur Şimşek on 5.08.2022.
//

import SwiftUI
import CoreLocationUI


struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack(spacing:20){
            
            VStack {
                Text("Welcome the Weather App")
                    .bold().font(.title)
                Text("Please share your current location to get the weather in your area")
                    .padding()

            }
            
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
                .symbolVariant(.fill)
                .labelStyle(.titleAndIcon)
                .cornerRadius(30)
                .foregroundColor(.white)
            
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
