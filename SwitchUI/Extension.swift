//
//  ext.swift
//  SwitchUI
//
//  Created by Victor Varenik on 15.06.2022.
//

import SwiftUI

struct RectOnHover: ViewModifier {
    @State private var isHovered = false
    
    func body(content: Content) -> some View {
        content
            .background(Rectangle().stroke(Color("Selector"), lineWidth: 4).opacity(isHovered ? 1.0 : 0.0))
            .padding(3)
        .onHover { isHovered in
            withAnimation(.default.speed(1.3)) {
                self.isHovered = isHovered
            }
        }
    }
}


struct CircleOnHover: ViewModifier {
    @State private var isHovered = false
    
    func body(content: Content) -> some View {
        content
            .background(Circle().stroke(Color("Selector"), lineWidth: 4).opacity(isHovered ? 1.0 : 0.0))
        .onHover { isHovered in
            withAnimation(.default.speed(1.3)) {
                self.isHovered = isHovered
            }
        }
    }
}


extension View {
    func hoverRectAnimation() -> some View {
        return self.modifier(RectOnHover())
    }
    
    func hoverCircleAnimation() -> some View {
        return self.modifier(CircleOnHover())
    }
}
