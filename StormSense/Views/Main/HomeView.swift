//
//  HomeView.swift
//  StormSense
//
//  Created by Mehul Jain on 11/08/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            Image("Background")
                .resizable()
                .ignoresSafeArea()
            Image("House")
                .frame(maxWidth:.infinity,alignment: .top)
                .padding(.top,137)
            
            VStack{
                Text("Bengaluru")
                    .font(.largeTitle)
                VStack{
                    Text("19°"+"\n"+"Mostly Clear")
                    Text("H:24°  L:18°")
                        .font(.title3.weight(.semibold))
                }
                Spacer()
            }
            .padding(.top,51)
        }
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
