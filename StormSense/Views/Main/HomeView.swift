//
//  HomeView.swift
//  StormSense
//
//  Created by Mehul Jain on 11/08/24.
//

import SwiftUI
import BottomSheet

enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.83// 702/844 from Figma design
    case middle = 0.385 // 325/844 from Figma design
}

struct HomeView: View {
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    @State var bottomSheetTranslation: CGFloat = BottomSheetPosition.middle.rawValue
    
    
    var bottomSheetTranslationProrated:CGFloat{
        (bottomSheetTranslation - BottomSheetPosition.middle.rawValue)/(BottomSheetPosition.top.rawValue-BottomSheetPosition.middle.rawValue)
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                let screenHeight = geometry.size.height +
                geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom
                ZStack {
                    Color("background")
                        .ignoresSafeArea()
                    Image("Background")
                        .resizable()
                        .ignoresSafeArea()
                    Image("House")
                        .frame(maxWidth: .infinity, alignment: .top)
                        .padding(.top, 137)
                    
                    VStack(spacing: -10) {
                        Text("Bengaluru")
                            .font(.largeTitle)
                        VStack {
                            Text(attributedString)
                            
                            Text("H:24°  L:18°")
                                .font(.title3.weight(.semibold))
                        }
                        Spacer()
                    }
                    .padding(.top, 51)
                    BottomSheetView(position:$bottomSheetPosition){
                        Text(bottomSheetTranslationProrated.formatted())
                    }
                    
                    .navigationBarHidden(true)
                }
            }
        }
        
        var attributedString: AttributedString {
            var string = AttributedString("19°\nMostly Clear")
            
            if let temp = string.range(of: "19°") {
                string[temp].font = .system(size: 96, weight: .thin)
                string[temp].foregroundColor = .primary
            }
            
            if let weather = string.range(of: "Mostly Clear") {
                string[weather].font = .title3.weight(.semibold)
                string[weather].foregroundColor = .secondary
            }
            return string
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
