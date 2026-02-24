//
//  Utils.swift
//  DesignPedia
//
//  Created by Marie on 22/02/2026.
//
import SwiftUI
import UIKit

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

extension Color {
    static let retroYellow = Color(uiColor: .retroYellow)
    static let retroPink = Color(uiColor: .retroPink)
    static let retroLightPink = Color(uiColor: .retroLightPink)
    static let retroDarkPink = Color(uiColor: .retroDarkPink)
}

extension UIColor {
    static let retroYellow = UIColor(hex: "#F4C400")
    static let retroPink = UIColor(hex: "#F06292")
    static let retroLightPink = UIColor(hex: "#F48FB1")
    static let retroDarkPink = UIColor(hex: "#D81B60")
}

extension UIColor {
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        if hex.hasPrefix("#") { scanner.currentIndex = hex.index(after: hex.startIndex) }

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = CGFloat((rgb >> 16) & 0xFF) / 255
        let g = CGFloat((rgb >> 8) & 0xFF) / 255
        let b = CGFloat(rgb & 0xFF) / 255

        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}

struct ClockView: View {
    @State private var currentDate = Date()
    
    var body: some View {
        TimelineView(.periodic(from: .now, by: 1)) { context in
            let date = context.date
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: date) % 12
            let minute = calendar.component(.minute, from: date)
            let second = calendar.component(.second, from: date)
            
            ZStack {
                // Clock background
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemGray6))
                    .shadow(color: .white.opacity(0.7), radius: 4, x: -2, y: -2)
                    .shadow(color: .black.opacity(0.2), radius: 4, x: 2, y: 2)
                
                GeometryReader { geo in
                    let center = CGPoint(x: geo.size.width / 2, y: geo.size.height / 2)
                    let radius = min(geo.size.width, geo.size.height) / 2 - 8
                    
                    ZStack {
                        // Hour ticks
                        ForEach(0..<12) { i in
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: 2, height: radius * 0.1)
                                .offset(y: -radius + radius*0.05)
                                .rotationEffect(.degrees(Double(i) / 12 * 360))
                        }
                        
                        // Hour hand
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 3, height: radius * 0.5)
                            .offset(y: -radius * 0.25)
                            .rotationEffect(.degrees(Double(hour) / 12 * 360 + Double(minute)/60 * 30))
                        
                        // Minute hand
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 2, height: radius * 0.7)
                            .offset(y: -radius * 0.35)
                            .rotationEffect(.degrees(Double(minute)/60 * 360 + Double(second)/60 * 6))
                        
                        // Second hand
                        Rectangle()
                            .fill(Color.red)
                            .frame(width: 1, height: radius * 0.9)
                            .offset(y: -radius * 0.45)
                            .rotationEffect(.degrees(Double(second)/60 * 360))
                        
                        // Center circle
                        Circle()
                            .fill(Color.black)
                            .frame(width: 6, height: 6)
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

