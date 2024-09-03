//
//  WeatherWidget.swift
//  StormSense
//
//  Created by Mehul Jain on 03/09/24.
//

import SwiftUI

struct WeatherWidget: View {
    var forecast:Forecast
    var body: some View {
        ZStack(alignment:.bottom){
            Trapezoid()
                .fill(Color.weatherWidgetBackground)
                .frame(width:342,height:174)
            HStack(alignment:.bottom){
                VStack(alignment:.leading,spacing:8){
                    Text("\(forecast.temperature)°")
                        .font(.system(size: 64))
                    
                    VStack{
                        Text("H:\(forecast.high)° L:\(forecast.low)° ")
                            .font(.footnote)
                            .foregroundStyle(Color.secondary)
                        
                        Text(forecast.location)
                            .font(.body)
                            .lineLimit(1)
                    }
                }
                Spacer()
                
                VStack{
                    Image("\(forecast.icon)large")
                        .padding(.trailing,4)
                    
                    Text(forecast.weather.rawValue)
                        .font(.footnote)
                        .padding(.trailing,24)
                }
            }
            .foregroundStyle(Color.white)
            .padding(.bottom,20)
            .padding(.leading,20)
        }
        .frame(width: 342,height: 184,alignment: .bottom)
    }
}

#Preview {
    WeatherWidget(forecast: Forecast.cities[0])
}
