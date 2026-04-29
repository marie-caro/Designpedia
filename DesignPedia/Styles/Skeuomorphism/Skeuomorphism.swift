//
//  Skeuomorphism.swift
//  DesignPedia
//
//  Created by Marie on 22/02/2026.
//
import SwiftUI

struct Skeuomorphism: DesignStyle {

    let id: UUID = UUID()
    let name: String = "Skeuomorphism"
    let designId: Int = 1
    let description: String =
        "Real-world inspired design that mimics physical materials like leather, paper, or metal with realistic depth and texture."
    let originYear: String = "2007"
    let context: String =
        "Popular in early iOS and desktop UI designs to make digital interfaces feel tangible."
    let influences: [String] = ["Real-world objects", "Industrial design"]
    let shapes: [ShapeStyle] = [.rounded, .organic]
    let colors: [Color] = [
        Color(red: 0.78, green: 0.76, blue: 0.74),
        Color(red: 0.93, green: 0.91, blue: 0.89)
    ]
    let typography: String = "Classic serif or sans-serif fonts depending on realism"
    let shadows: [ShadowStyle] = [
        ShadowStyle(color: .black.opacity(0.4), radius: 10, x: 0, y: 6, opacity: 0.4)
    ]
    let opacity: Double = 1.0
    let texture: TextureStyle = .matte
    let quickCues: [String] = [
        "Real materials, gradients, bevels, and inner shadows",
        "Looks like physical objects (buttons, cards, paper)",
    ]
    let commonUse: [String] = ["Music", "Notes", "Calendar", "E‑commerce"]

    func clockView() -> AnyView {
        AnyView(SkeuoClockView())
    }
    func textView() -> AnyView {
        AnyView(SkeuoTextView())
    }

    func drawView() -> AnyView {
        AnyView(SkeuoDraw())
    }
    func widgetsView() -> AnyView {
        AnyView(SkeuoWidgetView())
    }
}
