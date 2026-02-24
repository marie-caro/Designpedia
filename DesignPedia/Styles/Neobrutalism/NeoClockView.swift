//
//  NeuClockView.swift
//  DesignPedia
//
//  Created by Marie on 24/02/2026.
//

import SwiftUI
import SwiftData
import Observation

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
