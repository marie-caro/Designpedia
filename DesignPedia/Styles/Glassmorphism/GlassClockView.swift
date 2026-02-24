//
//  GlassClockView.swift
//  DesignPedia
//
//  Created by Marie on 24/02/2026.
//

import SwiftUI
import SwiftData
import Observation

struct GlassmorphismClockView: View {
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
                        /*Circle()
                            .fill(Color.gray)
                            .frame(width: 75, height: 75)
                            .offset(x: -40, y: -40)*/

                        Circle()
                            .fill(Color.gray.opacity(0.4))
                            .glassEffect(.regular, in: .circle)
                            .frame(width: 85, height: 85)

                        /*.fill(Color.gray.opacity(0.4))
                            .background(.ultraThinMaterial, in: Circle())
                            .frame(width: 85, height: 85)
                            .overlay(
                               Circle()
                                    .stroke(Color.white.opacity(0.45), lineWidth: 1)
                            )*/

                        // Hour ticks
                        ForEach(0..<60) { i in
                            Rectangle()
                                .fill(Color(.systemGray5))
                                .frame(width: 1, height: radius * 0.12)
                                .offset(y: -radius*1.12)
                                .rotationEffect(.degrees(Double(i) / 60 * 360))
                        }

                        // Hour hand
                        Rectangle()
                            .fill(Color.gray.opacity(0.6))
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
                            .fill(Color.gray.opacity(0.5))
                            .frame(width: 1, height: radius * 1.24)
                            .offset(y: -radius * 0.45)
                            .rotationEffect(.degrees(Double(second)/60 * 360))
                        
                        // Center circle
                        Circle()
                            .fill(Color.white.opacity(0.5))
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
