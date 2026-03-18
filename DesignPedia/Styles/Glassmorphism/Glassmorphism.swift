//
//  Glassmorphism.swift
//  DesignPedia
//
//  Created by Marie on 23/02/2026.
//
import SwiftUI
import SwiftData
import Observation

struct Glassmorphism: DesignStyle {
    
    let id: UUID = UUID()
    let name: String = "Glassmorphism"
    let designId: Int = 3
    let description: String =
    "Soft, extruded elements blending with the background using subtle shadows and highlights for a pseudo-3D effect."
    let originYear: String = "2019"
    let context: String =
    "A modern take on skeuomorphism, mainly used in UI components like buttons and cards."
    let influences: [String] = ["Skeuomorphism", "Flat Design"]
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
        
    
    func clockView() -> AnyView {
        AnyView(
            GlassmorphismClockView()
        )
    }
    func textView() -> AnyView {
        AnyView(
            GlassTextView()
        )
    }
    
    @State var clearButtonState: Bool = false
    func drawView() -> AnyView {
        AnyView(
            GlassDraw(clearButtonState: $clearButtonState)
        )
    }
    func widgetsView() -> AnyView {
        AnyView(
            GlassWidgetView()
                .environment(ThemeEnvironment(initialStyle: Glassmorphism()))
        )
    }

}
