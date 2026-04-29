//
//  DesignStyle.swift
//  DesignPedia
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

protocol DesignStyle: Identifiable {
    var id: UUID { get }
    var name: String { get }
    var designId: Int { get }
    var description: String { get }
    
    var originYear: String { get }
    var context: String { get }
    var influences: [String] { get }
    
    var shapes: [ShapeStyle] { get }
    var colors: [Color] { get }
    var typography: String { get }
    var shadows: [ShadowStyle] { get }
    var opacity: Double { get }
    var texture: TextureStyle { get }

    var quickCues: [String] { get }
    var commonUse: [String] { get }
    
    func clockView() -> AnyView
    func textView() -> AnyView
    func drawView() -> AnyView
    func widgetsView() -> AnyView
}

extension DesignStyle {
    var quickCues: [String] { [] }
    var commonUse: [String] { [] }
}
