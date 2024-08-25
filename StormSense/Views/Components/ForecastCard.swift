//
//  ForecastCard.swift
//  StormSense
//
//  Created by Mehul Jain on 25/08/24.
//

import SwiftUI

struct InnerShadow: ViewModifier {
    var color: Color
    var radius: CGFloat
    var x: CGFloat
    var y: CGFloat

    func body(content: Content) -> some View {
        content
            .overlay(
                content
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .shadow(color: color, radius: radius, x: x, y: y)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 30)
                            .inset(by: -radius)
                    )
                    .mask(
                        RoundedRectangle(cornerRadius: 30)
                    )
            )
    }
}

extension View {
    func innerShadow(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) -> some View {
        self.modifier(InnerShadow(color: color, radius: radius, x: x, y: y))
    }
}
