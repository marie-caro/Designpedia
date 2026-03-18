//
//  SkeuoDraw.swift
//  DesignPedia
//
//  Created by Marie on 26/02/2026.
//

import SwiftUI

struct SkeuoDraw: View {
    @State private var toggleStates: [Bool] = Array(repeating: false, count: 24)
    var colors = [Color.white, Color.cyan.opacity(0.25)]
    @Binding var clearButtonState: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 6), spacing: 10) {
                ForEach(0..<toggleStates.count, id: \.self) { index in
                    Circle()
                        .fill(toggleStates[index] ? colors[1] : colors[0])
                        .frame(width: 20, height: 20)
                        .overlay(
                            Circle().stroke(colors[1], lineWidth: 1)
                        )
                        .onTapGesture {
                            toggleStates[index].toggle()
                        }
                }
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.cyan)
                    .frame(width: 75, height: 15)
                Text("Clear canvas")
                    .foregroundColor(.white)
                    .font(.caption)
                    .onTapGesture {
                        clearButtonState.toggle()
                            toggleStates = Array(repeating: false, count: 24)
                    }
            }
        }
        .padding()
    }
}
