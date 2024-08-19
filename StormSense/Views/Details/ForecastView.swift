//
//  ForecastView.swift
//  StormSense
//
//  Created by Mehul Jain on 18/08/24.
//

import SwiftUI
import BottomSheet

struct ForecastView: View {
    var body: some View {
        ScrollView {
            
        }
        .backgroundblur(radius: 25,opaque:true)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .overlay{
            RoundedRectangle(cornerRadius: 44)
                .stroke(.white,lineWidth: 1)
                .offset(y:1)
                .blur(radius: 0)
                .mask{
                    RoundedRectangle(cornerRadius: 44)
                }
            
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
}
