//
//  GlassDraw.swift
//  DesignPedia
//
//  Created by Marie on 26/02/2026.
//

import SwiftUI

struct GlassDraw: View {
    @State private var toggleStates: [Bool] = Array(repeating: false, count: 24)

    private let blurRadius: CGFloat = 8

    var body: some View {
        VStack(spacing: 16) {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 6), spacing: 10) {
                ForEach(0..<toggleStates.count, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(toggleStates[index] ? Color.white.opacity(0.35) : Color.white.opacity(0.15))
                        .background(
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(Color.white.opacity(0.08))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .stroke(
                                    LinearGradient(
                                        colors: [Color.white.opacity(0.7), Color.white.opacity(0.05)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    lineWidth: 1
                                )
                        )
                        .frame(width: 22, height: 22)
                        .blur(radius: 0.1)
                        .background(
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(Color.black.opacity(0.15))
                                .blur(radius: blurRadius)
                                .offset(x: 2, y: 2)
                                .opacity(0.2)
                        )
                        .onTapGesture {
                            toggleStates[index].toggle()
                        }
                }
            }

            ZStack {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color.white.opacity(0.18))
                    .frame(width: 140, height: 36)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(
                                LinearGradient(
                                    colors: [Color.white.opacity(0.8), Color.white.opacity(0.1)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(Color.black.opacity(0.15))
                            .blur(radius: blurRadius)
                            .offset(x: 2, y: 2)
                            .opacity(0.25)
                    )

                Text("Clear canvas")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.9))
                    .onTapGesture {
                        toggleStates = Array(repeating: false, count: 24)
                    }
            }
        }
        .padding()
    }
}

