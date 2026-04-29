//
//  Styles.swift
//  DesignPedia
//
//  Created by Marie on 22/02/2026.
//
import SwiftUI

struct Neumorphism: DesignStyle {

    let id: UUID = UUID()
    let name: String = "Neumorphism"
    let designId: Int = 2
    let description: String =
        "Soft, extruded elements blending with the background using subtle shadows and highlights for a pseudo-3D effect."
    let originYear: String = "2019"
    let context: String =
        "A modern take on skeuomorphism, mainly used in UI components like buttons and cards."
    let influences: [String] = ["Skeuomorphism", "Flat Design"]
    let shapes: [ShapeStyle] = [.rounded]
    let colors: [Color] = [
        Color.cyan.opacity(0.3),
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
        "Soft extruded surfaces, subtle highlight + shadow",
        "Low contrast; relies on spacing and depth more than borders",
    ]
    let commonUse: [String] = ["Controls", "Dashboards", "Settings", "Cards"]

    func clockView() -> AnyView {
        AnyView(NeuClockView())
    }
    func textView() -> AnyView {
        AnyView(NeuTextView())
    }

    func drawView() -> AnyView {
        AnyView(NeuDraw())
    }
    func widgetsView() -> AnyView {
        AnyView(NeuWidgetView())
    }
}
