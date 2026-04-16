//
//  SkeuoDraw.swift
//  DesignPedia
//
//  Created by Marie on 26/02/2026.
//

import SwiftUI

struct SkeuoDraw: View {
    @State private var toggleStates: [Bool] = Array(repeating: false, count: 24)
    @Binding var clearButtonState: Bool

    private let offFill = Color.gray.opacity(0.15)
    private let onFill = Color(red: 0.85, green: 0.4, blue: 0.2)

    var body: some View {
        VStack(spacing: 16) {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 6), spacing: 10) {
                ForEach(0..<toggleStates.count, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(
                            LinearGradient(
                                colors: [Color(white: 0.6), Color(white: 0.95)],
                                startPoint: .top,
                                endPoint: .bottom
                            ),
                            lineWidth: 1
                        )
                        .background(
                            RoundedRectangle(cornerRadius: 3)
                                .fill(
                                    LinearGradient(
                                        colors: toggleStates[index]
                                        ? [onFill.opacity(0.9), onFill.opacity(0.7)]
                                        : [offFill, offFill.opacity(0.8)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .shadow(color: .black.opacity(0.15), radius: 1.5, x: 1, y: 1)
                                .shadow(color: .white.opacity(0.6), radius: 1, x: -1, y: -1)
                        )
                        .frame(width: 22, height: 22)
                        .onTapGesture {
                            toggleStates[index].toggle()
                        }
                }
            }

            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 130, height: 32)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(
                                LinearGradient(
                                    colors: [Color(white: 0.6), Color(white: 0.95)],
                                    startPoint: .top,
                                    endPoint: .bottom
                                ),
                                lineWidth: 1
                            )
                    )
                    .shadow(color: .white.opacity(0.8), radius: 2, x: 0, y: -1)
                    .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 1)

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

