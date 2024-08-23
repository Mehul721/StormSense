//
//  HomeView.swift
//  StormSense
//
//  Created by Mehul Jain on 11/08/24.
//

import SwiftUI
import BottomSheet

enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.83 // from Figma design
    case middle = 0.385 // from Figma design
}

struct HomeView: View {
    @State private var bottomSheetPosition: BottomSheetPosition = .middle
    @State private var bottomSheetTranslation: CGFloat = BottomSheetPosition.middle.rawValue
    @State private var hasDragged: Bool = false
    
    private var bottomSheetTranslationProrated: CGFloat {
        (bottomSheetTranslation - BottomSheetPosition.middle.rawValue) / (BottomSheetPosition.top.rawValue - BottomSheetPosition.middle.rawValue)
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                let screenHeight = geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom
                let imageOffset = screenHeight + 36
                
                ZStack {
                    Color("background").ignoresSafeArea()
                    
                    Image("Background")
                        .resizable()
                        .ignoresSafeArea()
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)
                    
                    Image("House")
                        .frame(maxWidth: .infinity, alignment: .top)
                        .padding(.top, 137)
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)
                    
                    VStack(spacing: -10 * (1 - bottomSheetTranslationProrated)) {
                        Text("Bengaluru")
                            .font(.largeTitle)
                        
                        VStack {
                            Text(attributedString)
                            
                            Text("H:24°  L:18°")
                                .font(.title3.weight(.semibold))
                                .opacity(1 - bottomSheetTranslationProrated)
                        }
                        Spacer()
                    }
                    .padding(.top, 51)
                    .offset(y: -bottomSheetTranslationProrated * 46)
                    
                    BottomSheetView(position: $bottomSheetPosition) {
                       // Text(bottomSheetTranslationProrated.formatted())
                    }
                    TabBar(action: {
                        withAnimation {
                            bottomSheetPosition = .top
                        }
                    })
                    .offset(y: bottomSheetTranslationProrated * 115)
                }
                .onChange(of: bottomSheetPosition) { newValue in
                    withAnimation(.easeInOut) {
                        hasDragged = newValue == .top
                    }
                }
                .navigationBarHidden(true)
            }
        }
    }
    
    private var attributedString: AttributedString {
        var string = AttributedString("19°"+(hasDragged ? "|":"\n")+"Mostly Clear")
        
        if let temp = string.range(of: "19°") {
            string[temp].font = .system(size: (96-(bottomSheetTranslationProrated*(96-20))), weight:hasDragged ?.semibold :.thin)
            string[temp].foregroundColor = hasDragged ?.secondary :.primary
        }
        
        if let weather = string.range(of: "Mostly Clear") {
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary.opacity(bottomSheetTranslationProrated)
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

