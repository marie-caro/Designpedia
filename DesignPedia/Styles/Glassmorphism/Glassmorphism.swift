//
//  Glassmorphism.swift
//  DesignPedia
//
//  Created by Marie on 23/02/2026.
//

import SwiftUI

struct Glassmorphism: DesignStyle {

    let id: UUID = UUID()
    let name: String = "Glassmorphism"
    let designId: Int = 3
    let description: String =
        "Translucent, frosted-glass panels with blur effects and subtle borders over colorful backgrounds."
    let originYear: String = "2020"
    let context: String =
        "Popularized by macOS Big Sur and iOS 14, creating depth through layered transparency."
    let influences: [String] = ["Aero glass", "Material Design"]
    let shapes: [ShapeStyle] = [.rounded]
    let colors: [Color] = [
        Color.black.opacity(0.3),
        Color.white.opacity(0.01)
    ]
    let typography: String = "Minimal, sans-serif fonts"
    let shadows: [ShadowStyle] = [
        ShadowStyle(color: .white, radius: 5, x: -5, y: -5, opacity: 0.8),
        ShadowStyle(color: .black.opacity(0.2), radius: 5, x: 5, y: 5, opacity: 0.2)
    ]
    let opacity: Double = 1.0
    let texture: TextureStyle = .matte
    let quickCues: [String] = [
        "Frosted glass panels with blur and translucent fills",
        "Bright highlights + thin strokes over colorful backgrounds",
    ]
    let commonUse: [String] = ["Overlays", "Player UI", "Widgets", "Landing screens"]
        
    func clockView() -> AnyView {
        AnyView(GlassmorphismClockView())
    }
    func textView() -> AnyView {
        AnyView(GlassTextView())
    }

    func drawView() -> AnyView {
        AnyView(GlassDraw())
    }
    func widgetsView() -> AnyView {
        AnyView(GlassWidgetView())
    }
}
