//
//  Skeuomorphism.swift
//  DesignPedia
//
//  Created by Marie on 22/02/2026.
//
import SwiftUI
import SwiftData
import Observation

struct SkeuoTextView: View {
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

struct SkeuoClockView: View {
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
                            .shadow(color: .gray, radius: 2, x: 0, y: 0,)
                            .frame(width: 85, height: 85)
                            .overlay {
                                Circle()
                                    .fill(Color.white)
                                    .shadow(color: .black, radius: 2, x: 0, y: 0,)
                                    .frame(width: 75, height: 75)
                                    .shadow(color: .white, radius: 3, x: 0, y: 0,)
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 73, height: 73)
                                    .shadow(color: .black, radius: 1.5, x: 0, y: 0,)
                            }
                        
                        // Hour ticks
                        ForEach(0..<60) { i in
                            if i == 0 || i == 15 || i == 30 || i == 45 {
                                Rectangle()
                                    .fill(Color.black)
                                    .frame(width: 1.6, height: radius * 0.17)
                                    .offset(y: -radius*1.17)
                                    .rotationEffect(.degrees(Double(i) / 60 * 360))
                            } else {
                                Rectangle()
                                    .fill(Color.black)
                                    .frame(width: 0.35, height: radius * 0.06)
                                    .offset(y: -radius*1.2)
                                    .rotationEffect(.degrees(Double(i) / 60 * 360))
                            }
                        }
                        
                        // Hour hand
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 1.5, height: radius * 0.8)
                            .offset(y: -radius * 0.15)
                            .rotationEffect(.degrees(Double(hour) / 12 * 360 + Double(minute)/60 * 30))
                        
                        // Minute hand
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 1.5, height: radius * 1.2)
                            .offset(y: -radius * 0.35)
                            .rotationEffect(.degrees(Double(minute)/60 * 360 + Double(second)/60 * 6))
                        
                        // Second hand
                        Rectangle()
                            .fill(Color.red)
                            .frame(width: 1, height: radius * 1)
                            .offset(y: -radius * 0.25)
                            .rotationEffect(.degrees(Double(second)/60 * 360))
                        
                        // Center circle
                        Circle()
                            .fill(Color.black)
                            .frame(width: 3, height: 3)
                            .overlay {
                                Circle()
                                    .fill(Color.gray)
                                    .frame(width: 2, height: 2)
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
            SkeuoClockView()
        )
    }
    func textView() -> AnyView {
        AnyView(
            FlatClockView()
        )
    }

}
