//
//  HomeView.swift
//  StormSense
//
//  Created by Mehul Jain on 11/08/24.
//

import SwiftUI
import BottomSheet

enum BottomSheetPosition: CGFloat,CaseIterable{
    case top = 0.83 //702/844 from fogma design
    case middle = 0.385 //325/844 from figma design
}

struct HomeView: View {
    
    @State var bottomsheetposition: BottomSheetPosition = .middle
    var body: some View {
        NavigationView  {
            ZStack{
                Color.background
                    .ignoresSafeArea()
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                Image("House")
                    .frame(maxWidth:.infinity,alignment: .top)
                    .padding(.top,137)
                
             
                VStack(spacing:-10){
                    
                    Text("Bengaluru")
                        .font(.largeTitle)
                    VStack{
                        
                        
                        Text(attributedString)
                        
                        Text("H:24°  L:18°")
                            .font(.title3.weight(.semibold))
                    }
                    Spacer()
                }
                .padding(.top,51)
                
                
                }
                TabBar(action: {})
            }
            
        }
            
        }
    
    private var attributedString:AttributedString{
        var string=AttributedString("19°"+"\n "+"Mostly Clear")
        
        if let temp=string.range(of:"19°"){
            string[temp].font = .system(size: 96,weight:.thin)
            string[temp].foregroundColor = .primary
        
    }
        if let pipe = string.range(of: " | "){
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary
        }
        if let weather = string.range(of: "Mostly Clear"){
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        return string
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
