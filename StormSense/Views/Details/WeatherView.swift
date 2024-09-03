//
//  WeatherView.swift
//  StormSense
//
//  Created by Mehul Jain on 02/09/24.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            
            ScrollView(showsIndicators:false){
                VStack{
                    ForEach(Forecast.cities){
                        forecast in
                        WeatherWidget(forecast: forecast)
                    }
                }
            }
            .safeAreaInset(edge:.top){
                EmptyView()
                    .frame(height:110)
            }
        }
        .overlay{
            NavigationBar()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    WeatherView()
}
