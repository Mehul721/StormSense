//
//  Blur.swift
//  StormSense
//
//  Created by Mehul Jain on 19/08/24.
//

import SwiftUI
class UIBackdropView:UIView{
    override class var layerClass: AnyClass{
        NSClassFromString("CABackgroundLayer") ?? CALayer.self
    }
}
struct Backdrop:UIViewRepresentable{
    func makeUIView(context: Context) -> some UIView {
        UIBackdropView()
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct Blur: View {
    var radius:CGFloat = 3
    var opaque:Bool = false
    
    var body: some View {
        Backdrop()
            .blur(radius: self.radius,opaque: self.opaque)
    }
}

#Preview {
    Blur()
}
