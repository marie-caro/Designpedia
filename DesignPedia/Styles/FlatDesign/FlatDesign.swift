//
//  FlatDesign.swift
//  DesignPedia
//
//  Created by Marie on 24/02/2026.
//

import SwiftUI

struct FlatDesign: DesignStyle {

    let id: UUID = UUID()
    let name: String = "FlatDesign"
    let designId: Int = 4
    let description: String =
        "Minimalist design with solid colors, simple shapes, and no decorative effects like gradients or shadows."
    let originYear: String = "2007"
    let context: String =
        "Popularized by Microsoft Metro and Apple iOS 7, emphasizing content over chrome."
    let influences: [String] = ["Swiss Style", "Bauhaus"]
    let shapes: [ShapeStyle] = [.rounded, .organic]
    let colors: [Color] = [
        Color.gray.opacity(0.2),
        Color.gray.opacity(0.1)
    ]
    let typography: String = "Classic serif or sans-serif fonts depending on realism"
    let shadows: [ShadowStyle] = [
        ShadowStyle(color: .black.opacity(0.4), radius: 10, x: 0, y: 6, opacity: 0.4)
    ]
    let opacity: Double = 1.0
    let texture: TextureStyle = .matte
    let quickCues: [String] = [
        "Minimal shapes, solid colors, little to no depth",
        "Hierarchy through color, spacing, and typography",
    ]
    let commonUse: [String] = ["Productivity", "Onboarding", "Lists", "Forms"]

    func clockView() -> AnyView {
        AnyView(FlatClockView())
    }

    func widgetsView() -> AnyView {
        AnyView(FlatWidgetView())
    }

    func textView() -> AnyView {
        AnyView(FlatTextView())
    }

    func drawView() -> AnyView {
        AnyView(FlatDraw())
    }
}
