//
//  DesignStyle.swift
//  DesignPediq
//
//  Created by Marie on 18/02/2026.
//

import SwiftUI


enum ShapeStyle: String {
    case rounded
    case sharp
    case organic
    case geometric
}

struct ShadowStyle {
    var color: Color
    var radius: CGFloat
    var x: CGFloat
    var y: CGFloat
    var opacity: Double
}

enum TextureStyle: String {
    case glassy
    case matte
    case clay
    case none
}

class DesignStyle: Identifiable {
    let id = UUID()
    var name: String
    var designId: Int
    var description: String
    
    var originYear: String
    var context: String
    var influences: [String]
    
    var shapes: [ShapeStyle]
    var colors: [Color]
    var typography: String
    var shadows: [ShadowStyle]
    var opacity: Double
    var texture: TextureStyle
    
    init(
        name: String,
        designId: Int,
        description: String,
        originYear: String,
        context: String,
        influences: [String],
        shapes: [ShapeStyle],
        colors: [Color],
        typography: String,
        shadows: [ShadowStyle],
        opacity: Double,
        texture: TextureStyle
    ) {
        self.name = name
        self.designId = designId
        self.description = description
        self.originYear = originYear
        self.context = context
        self.influences = influences
        self.shapes = shapes
        self.colors = colors
        self.typography = typography
        self.shadows = shadows
        self.opacity = opacity
        self.texture = texture
    }
}
