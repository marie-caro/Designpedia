//
//  DesignStyles.swift
//  DesignPediq
//
//  Created by Marie on 18/02/2026.
//

import SwiftUI

class DesignStyles {
    static let shared = DesignStyles()
    
    let glassmorphism: DesignStyle
    let neumorphism: DesignStyle
    let skeuomorphism: DesignStyle
    let flatDesign: DesignStyle
    let neobrutalism: DesignStyle
    let claymorphism: DesignStyle
    let materialDesign: DesignStyle
    
    let all: [DesignStyle]
    
    private init() {
        glassmorphism = DesignStyle(
            name: "Glassmorphism",
            designId: 1,
            description: "Translucent, frosted glass-like panels that emphasize depth and layering with soft shadows and vibrant colors.",
            originYear: "2020",
            context: "Popularized in UI design for apps and websites emphasizing futuristic, layered interfaces.",
            influences: ["Frosted glass design", "iOS 7 Blur Effects", "Neumorphism"],
            shapes: [.rounded, .geometric],
            colors: [Color.blue.opacity(0.8), Color.white.opacity(0.3)],
            typography: "Clean, sans-serif fonts",
            shadows: [
                ShadowStyle(color: .black.opacity(0.1), radius: 10, x: 0, y: 5, opacity: 0.1)
            ],
            opacity: 0.5,
            texture: .glassy
        )
        
        neumorphism = DesignStyle(
            name: "Neumorphism",
            designId: 2,
            description: "Soft, extruded elements blending with the background using subtle shadows and highlights for a pseudo-3D effect.",
            originYear: "2019",
            context: "A modern take on skeuomorphism, mainly used in UI components like buttons and cards.",
            influences: ["Skeuomorphism", "Flat Design"],
            shapes: [.rounded],
            colors: [Color.gray.opacity(0.2), Color.gray.opacity(0.1)],
            typography: "Minimal, sans-serif fonts",
            shadows: [
                ShadowStyle(color: .white, radius: 5, x: -5, y: -5, opacity: 0.8),
                ShadowStyle(color: .black.opacity(0.2), radius: 5, x: 5, y: 5, opacity: 0.2)
            ],
            opacity: 1.0,
            texture: .matte
        )
        
        skeuomorphism = DesignStyle(
            name: "Skeuomorphism",
            designId: 3,
            description: "Real-world inspired design that mimics physical materials like leather, paper, or metal with realistic depth and texture.",
            originYear: "2007",
            context: "Popular in early iOS and desktop UI designs to make digital interfaces feel tangible.",
            influences: ["Real-world objects", "Industrial design"],
            shapes: [.rounded, .organic],
            colors: [Color.brown, Color.gray],
            typography: "Classic serif or sans-serif fonts depending on realism",
            shadows: [
                ShadowStyle(color: .black.opacity(0.4), radius: 10, x: 0, y: 6, opacity: 0.4)
            ],
            opacity: 1.0,
            texture: .matte
        )
        
        flatDesign = DesignStyle(
            name: "Flat Design",
            designId: 4,
            description: "Minimalistic design that removes depth, shadows, and textures in favor of solid colors and simple shapes.",
            originYear: "2013",
            context: "Web and mobile interfaces that focus on usability and fast loading, pioneered by Microsoft’s Metro UI and Apple iOS 7.",
            influences: ["Minimalism", "Swiss Design"],
            shapes: [.geometric, .sharp],
            colors: [Color.blue, Color.red, Color.yellow, Color.green],
            typography: "Bold, sans-serif fonts",
            shadows: [],
            opacity: 1.0,
            texture: .none
        )
        
        neobrutalism = DesignStyle(
            name: "Neobrutalism",
            designId: 5,
            description: "Bold, high-contrast design with thick borders, harsh shadows, and raw, unpolished elements.",
            originYear: "2021",
            context: "Modern revival of brutalist architecture aesthetics for digital interfaces.",
            influences: ["Brutalism", "Raw HTML/CSS layouts"],
            shapes: [.sharp, .geometric],
            colors: [Color.yellow, Color.black, Color.white, Color.red],
            typography: "Bold, monospace or blocky fonts",
            shadows: [
                ShadowStyle(color: .black, radius: 0, x: 6, y: 6, opacity: 1.0)
            ],
            opacity: 1.0,
            texture: .none
        )
        
        claymorphism = DesignStyle(
            name: "Claymorphism",
            designId: 6,
            description: "Soft, rounded 3D elements that resemble molded clay with gentle shadows and playful colors.",
            originYear: "2021",
            context: "Used in playful app UIs, icons, and illustrations to convey softness and tactility.",
            influences: ["Soft 3D modeling", "Playful illustration"],
            shapes: [.rounded, .organic],
            colors: [Color.pink.opacity(0.7), Color.orange.opacity(0.7), Color.purple.opacity(0.7)],
            typography: "Friendly, rounded sans-serif fonts",
            shadows: [
                ShadowStyle(color: .black.opacity(0.2), radius: 15, x: 5, y: 8, opacity: 0.2)
            ],
            opacity: 1.0,
            texture: .clay
        )
        
        materialDesign = DesignStyle(
            name: "Material Design",
            designId: 7,
            description: "Layer-based design system emphasizing hierarchy, motion, and elevation with structured shadows and bold accent colors.",
            originYear: "2014",
            context: "Developed by Google for Android apps to unify visual language and interaction patterns.",
            influences: ["Swiss Design", "Paper metaphor"],
            shapes: [.rounded, .geometric],
            colors: [Color.blue, Color.white, Color.gray.opacity(0.2)],
            typography: "Roboto and other clean sans-serif fonts",
            shadows: [
                ShadowStyle(color: .black.opacity(0.2), radius: 4, x: 0, y: 2, opacity: 0.2),
                ShadowStyle(color: .black.opacity(0.15), radius: 8, x: 0, y: 4, opacity: 0.15)
            ],
            opacity: 1.0,
            texture: .matte
        )
        
        all = [glassmorphism, neumorphism, skeuomorphism, flatDesign, neobrutalism, claymorphism, materialDesign]
    }
}
