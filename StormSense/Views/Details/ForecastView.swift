//
//  ForecastView.swift
//  StormSense
//
//  Created by Mehul Jain on 18/08/24.
//

import SwiftUI
import BottomSheet

struct ForecastView: View {
    var bottomSheetTranslationProrated:CGFloat=1
    @State private var selection = 0
    var body: some View {
        ScrollView {
            VStack(spacing:0){
                SegmentedControl(selection: $selection)
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing:12){
                        if selection==0 {
                            ForEach(Forecast.hourly){
                                forecast in ForecastCard(forecast: forecast, forecastPeriod: .hourly)
                            }
                            .transition(.offset(x:-430))
                        } else {
                            ForEach(Forecast.daily){
                                forecast in ForecastCard(forecast: forecast, forecastPeriod: .daily)
                            }
                            .transition(.offset(x:430))
                        }
                    }
                    .padding(.vertical,20)
                }
                .padding(.horizontal,20)
                Image("Forecast Widgets")
                    .opacity(bottomSheetTranslationProrated)
            }
        }
        .backgroundblur(radius: 25,opaque:true)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        innerShadow(shape: RoundedRectangle(cornerRadius:44), color:Color.bottomSheetBorderMiddle,lineWidth: 1,OffsetX: 0,OffsetY: 1,blur: 0,blendMode: .overlay,opacity: 1-bottomSheetTranslationProrated)
            
                .overlay{
                    Divider()
                        .blendMode(.overlay)
                        .background(Color.bottomSheetBorderTop)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .clipShape(RoundedRectangle(cornerRadius: 44))
                }
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.black.opacity(0.3))
                        .frame(width: 48, height: 5)
                        .frame(height:20)
                        .frame(maxHeight: .infinity, alignment: .top)
                }
        }
    }
    
    struct ForecastView_Previews: PreviewProvider {
        static var previews: some View {
            ForecastView()
                .preferredColorScheme(.dark)
        }
    }

