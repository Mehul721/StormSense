//
//  NavigationBar.swift
//  StormSense
//
//  Created by Mehul Jain on 02/09/24.
//

import SwiftUI

struct NavigationBar: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing:8){
            HStack{
                Button{
                    dismiss()
                }label:{
                    HStack{
                        Image(systemName: "chevron.left")
                            .font(.system(size:23).weight(.medium))
                            .foregroundColor(.secondary)
                        
                        Text("Weather")
                            .font(.title)
                            .foregroundStyle(.primary)
                    }
                    .frame(height:44)
                    
                    
                    
                }
                Spacer()
                
                Image(systemName:"ellipse.circle")
                    .font(.system(size:28))
                    .frame(width:44,height:44,alignment:.trailing)
            }
            .frame(height:52)
        }
        .frame(height:106,alignment:.top)
        .padding(.horizontal,16)
        .padding(.top,49)
        .backgroundblur(radius:20,opaque:true)
        .background(Color.navBarBackground)
        .frame(maxHeight:.infinity,alignment: .top)
        .ignoresSafeArea()
        
        
    }}

#Preview {
    NavigationBar()
}
