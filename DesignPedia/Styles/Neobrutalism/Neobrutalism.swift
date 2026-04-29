//
//  Neobrutalism.swift
//  DesignPedia
//
//  Created by Marie on 24/02/2026.
//

import SwiftUI

struct Neobrutalism: DesignStyle {

    let id: UUID = UUID()
    let name: String = "Neobrutalism"
    let designId: Int = 5
    let description: String =
        "Bold, raw design with high contrast, thick borders, and intentionally unpolished aesthetics."
    let originYear: String = "2020"
    let context: String =
        "A reaction to overly polished UIs, embracing roughness and asymmetry for a distinctive look."
    let influences: [String] = ["Brutalist architecture", "Postmodernism"]
    let shapes: [ShapeStyle] = [.rounded, .organic]
    let colors: [Color] = [
        Color.retroYellow,
        Color.retroYellow,
    ]
    let typography: String = "Classic serif or sans-serif fonts depending on realism"
    let shadows: [ShadowStyle] = [
        ShadowStyle(color: .black.opacity(0.4), radius: 10, x: 0, y: 6, opacity: 0.4)
    ]
    let opacity: Double = 1.0
    let texture: TextureStyle = .matte
    let quickCues: [String] = [
        "Bold fills, thick strokes, hard offsets",
        "Playful, raw, intentionally “unpolished” look",
    ]
    let commonUse: [String] = ["Portfolios", "Creative apps", "Posters", "Editorial"]

    func clockView() -> AnyView {
        AnyView(NeobrutalismClockView())
    }
    func textView() -> AnyView {
        AnyView(NeoTextView())
    }

    func drawView() -> AnyView {
        AnyView(NeoDraw())
    }
    func widgetsView() -> AnyView {
        AnyView(NeoWidgetView())
    }
}
