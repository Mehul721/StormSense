//
//  TabBar.swift
//  StormSense
//
//  Created by Mehul Jain on 17/08/24.
//

import SwiftUI

struct TabBar: View {
    var action: () -> Void
    var body: some View {
        ZStack{
            HStack{
                Button{
                    action()
                    
                }label: {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width:44,height:44)
                        
                }
                Spacer()
                NavigationLink{
                    
                }label: {
                    Image(systemName: "list.star")
                        .frame(width:44,height:44)
                        
                }
            
            }
            .font(.title2)
            .foregroundStyle(.white)
            .padding(EdgeInsets(top: 20, leading: 32, bottom: 24, trailing: 32))
        }
        .frame(maxHeight:.infinity,alignment: .bottom)
        .ignoresSafeArea()
    }
}

#Preview {
    TabBar(action: {})
        .preferredColorScheme(.dark)
}
