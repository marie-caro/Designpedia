//
//  Styles.swift
//  DesignPedia
//
//  Created by Marie on 22/02/2026.
//
import SwiftUI
import SwiftData
import Observation

struct NeuTextView: View {
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

struct AnalogClockView: View {
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
                            .fill(Color.white)
                            .overlay(
                                Circle()
                                    .stroke(Color.white.opacity(0.9), lineWidth: 4)
                                    .shadow(color: Color.white.opacity(0.8), radius: 4, x: -4, y: -4)
                                    .shadow(color: Color.cyan.opacity(0.09), radius: 4, x: 4, y: 4)
                                    .clipShape(Circle())
                            )
                            //.fill(Color.cyan.opacity(0.07))
                            /*.fill(Color.neuomorphismClockBlue)
                            .frame(width: 89, height: 89)
                            .shadow(color: .white.opacity(0.9), radius: 10, x: -8, y: -8)
                            .shadow(color: .black.opacity(0.18), radius: 10, x: 8, y: 8)*/
    
                        // Hour ticks
                        ForEach(0..<60) { i in
                            Rectangle()
                                .fill(Color(.systemGray5))
                                .frame(width: 1, height: radius * 0.12)
                                .offset(y: -radius*1.12)
                                .rotationEffect(.degrees(Double(i) / 60 * 360))
                        }
                    
                        // back circle
                        Circle()
                            .fill(Color.white)
                            .frame(width: 63, height: 63)
                            .shadow(color: .gray.opacity(0.3), radius: 5, x: 4, y: 0,)

                        // Hour hand
                        Rectangle()
                            .fill(Color.black.opacity(0.6))
                            .frame(width: 2, height: radius * 0.5)
                            .offset(y: -radius * 0.25)
                            .rotationEffect(.degrees(Double(hour) / 12 * 360 + Double(minute)/60 * 30))
                        
                        // Minute hand
                        Rectangle()
                            .fill(Color.gray.opacity(0.6))
                            .frame(width: 2, height: radius * 1)
                            .offset(y: -radius * 0.35)
                            .rotationEffect(.degrees(Double(minute)/60 * 360 + Double(second)/60 * 6))
                        
                        // Second hand
                        Rectangle()
                            .fill(Color.red.opacity(0.5))
                            .frame(width: 1, height: radius * 1.24)
                            .offset(y: -radius * 0.45)
                            .rotationEffect(.degrees(Double(second)/60 * 360))
                        
                        // Center circle
                        Circle()
                            .fill(Color.red.opacity(0.5))
                            .frame(width: 4, height: 4)
                    }
                    .position(x: center.x, y: center.y)
                }
                .padding(8)
            }
            .aspectRatio(1, contentMode: .fit)
        }
        .frame(width: 100, height: 100)
    }
}

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


    func clockView() -> AnyView {
        AnyView(
            AnalogClockView()
        )
    }
    func textView() -> AnyView {
        AnyView(
            NeuTextView()
        )
    }

}
