//
//  BottomSheetView.swift
//  StormSense
//
//  Created by Mehul Jain on 19/08/24.
//

import SwiftUI

struct BottomSheetView<Content: View>: View {
    @Binding var position: BottomSheetPosition
    let content: Content

    init(position: Binding<BottomSheetPosition>, @ViewBuilder content: () -> Content) {
        _position = position
        self.content = content()
    }

    var body: some View {
        VStack {
            self.content
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)  // Ensure this matches your theme
        .cornerRadius(15)
        .shadow(radius: 5)
        .offset(y: position == .top ? 100 : UIScreen.main.bounds.height / 2)  // Adjust the offset based on position
  // Consider the type of animation that fits the user experience
    }
}
