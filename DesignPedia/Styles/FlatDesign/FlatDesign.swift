//
//  FlatDesign.swift
//  DesignPedia
//
//  Created by Marie on 24/02/2026.
//

import SwiftUI
import SwiftData
import Observation

struct FlatDesign: DesignStyle {

    let id: UUID = UUID()
    let name: String = "FlatDesign"
    let designId: Int = 4
    let description: String =
        "Real-world inspired design that mimics physical materials like leather, paper, or metal with realistic depth and texture."
    let originYear: String = "2007"
    let context: String =
        "Popular in early iOS and desktop UI designs to make digital interfaces feel tangible."
    let influences: [String] = ["Real-world objects", "Industrial design"]
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

    func clockView() -> AnyView {
        AnyView(
            FlatClockView()
        )
    }

    func textView() -> AnyView {
        AnyView(
            FlatTextView()
        )
    }
    func drawView() -> AnyView {
        AnyView(
            NeuTextView()
        )
    }
}
