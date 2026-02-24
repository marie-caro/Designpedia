//
//  Neobrutalism.swift
//  DesignPedia
//
//  Created by Marie on 24/02/2026.
//

import SwiftUI
import SwiftData
import Observation

struct NeoTextView: View {
    @State private var userInput: String = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.black)
                .offset(x: 6, y: 6)
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.retroPink)
                .frame(width: 230, height:40)
            TextField(" enter you secrets here...", text: $userInput)
        }
    }
}

struct NeobrutalismClockView: View {
    @State private var currentDate = Date()
    
    var body: some View {
        TimelineView(.periodic(from: .now, by: 1)) { context in
            let date = context.date
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: date) % 12
            let minute = calendar.component(.minute, from: date)
            let second = calendar.component(.second, from: date)
            
            ZStack {
                GeometryReader { geo in
                    let center = CGPoint(x: geo.size.width / 2, y: geo.size.height / 2)
                    let radius = min(geo.size.width, geo.size.height) / 2 - 8
                    
                    ZStack {
                        Circle()
                            .fill(Color.black)
                            .frame(width: 80, height: 80)
                            .offset(x: 6, y: 6)
                        Circle()
                            .fill(Color.retroPink)
                            .frame(width: 85, height: 85)
                            //.shadow(radius: 1, x:6, y: 2)

                        // Hour hand
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 4, height: radius * 0.6)
                            .offset(y: -radius * 0.35)
                            .rotationEffect(.degrees(Double(hour) / 12 * 360 + Double(minute)/60 * 30))
                        
                        // Minute hand
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 3.6, height: radius * 0.8)
                            .offset(y: -radius * 0.45)
                            .rotationEffect(.degrees(Double(minute)/60 * 360 + Double(second)/60 * 6))
                                                
                        // Center circle
                        Circle()
                            .fill(Color.black)
                            .frame(width: 6, height: 6)
                            .overlay {
                                Circle()
                                    .fill(Color.retroYellow)
                                    .frame(width: 3, height: 3)
                            }
                    }
                    .position(x: center.x, y: center.y)
                }
                .padding(8)
            }
            .aspectRatio(1, contentMode: .fit)
        }
        .frame(width: 90, height: 90)
    }
}

struct Neobrutalism: DesignStyle {

    let id: UUID = UUID()
    let name: String = "Neobrutalism"
    let designId: Int = 5
    let description: String =
        "Real-world inspired design that mimics physical materials like leather, paper, or metal with realistic depth and texture."
    let originYear: String = "2007"
    let context: String =
        "Popular in early iOS and desktop UI designs to make digital interfaces feel tangible."
    let influences: [String] = ["Real-world objects", "Industrial design"]
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

    func clockView() -> AnyView {
        AnyView(
            NeobrutalismClockView()
        )
    }
    func textView() -> AnyView {
        AnyView(
            NeoTextView()
        )
    }
}
