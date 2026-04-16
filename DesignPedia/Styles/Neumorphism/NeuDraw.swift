//
//  NeuDraw.swift
//  DesignPedia
//
//  Created by Marie on 26/02/2026.
//

import SwiftUI

struct NeuDraw: View {
    @State private var toggleStates: [Bool] = Array(repeating: false, count: 24)
    @Binding var clearButtonState: Bool

    private let baseColor = Color.cyan.opacity(0.25)

    var body: some View {
        VStack(spacing: 16) {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 6), spacing: 10) {
                ForEach(0..<toggleStates.count, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: toggleStates[index]
                                ? [Color.cyan.opacity(0.6), Color.cyan.opacity(0.4)]
                                : [baseColor, baseColor.opacity(0.8)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 22, height: 22)
                        .shadow(color: .white.opacity(0.7), radius: 3, x: -2, y: -2)
                        .shadow(color: .black.opacity(0.15), radius: 3, x: 2, y: 2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .stroke(Color.white.opacity(0.25), lineWidth: 0.5)
                        )
                        .onTapGesture {
                            toggleStates[index].toggle()
                        }
                }
            }

            ZStack {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(baseColor)
                    .frame(width: 130, height: 36)
                    .shadow(color: .white.opacity(0.7), radius: 3, x: -2, y: -2)
                    .shadow(color: .black.opacity(0.15), radius: 3, x: 2, y: 2)

                Text("Clear canvas")
                    .font(.caption)
                    .foregroundColor(.black.opacity(0.8))
                    .onTapGesture {
                        clearButtonState.toggle()
                        toggleStates = Array(repeating: false, count: 24)
                    }
            }
        }
        .padding()
    }
}

