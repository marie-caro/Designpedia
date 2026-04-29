//
//  HistoryView.swift
//  DesignPedia
//
//  Created by Marie on 21/04/2026.
//

import SwiftUI

struct HistoryView: View {
    @Environment(ThemeEnvironment.self) private var theme

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    theme.currentStyle.colors.last ?? .white,
                    theme.currentStyle.colors.first ?? .white
                ]),
                startPoint: .bottomLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Spacer()
                        StylePickerMenu()
                    }

                    VStack(alignment: .leading, spacing: 6) {
                        Text(theme.currentStyle.name)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(.black)

                        Text("Origin \(theme.currentStyle.originYear)")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.black.opacity(0.75))
                    }

                    section(title: "Description") {
                        Text(theme.currentStyle.description)
                            .font(.system(size: 14))
                            .foregroundStyle(.black.opacity(0.75))
                    }

                    section(title: "Context") {
                        Text(theme.currentStyle.context)
                            .font(.system(size: 14))
                            .foregroundStyle(.black.opacity(0.75))
                    }

                    section(title: "Quick cues") {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(theme.currentStyle.quickCues, id: \.self) { line in
                                HStack(alignment: .top, spacing: 8) {
                                    Text("•")
                                        .font(.system(size: 14, weight: .bold))
                                    Text(line)
                                        .font(.system(size: 14))
                                        .foregroundStyle(.black.opacity(0.75))
                                }
                            }
                        }
                    }

                    section(title: "Common use") {
                        ScrollView(.horizontal) {
                            HStack(spacing: 8) {
                                ForEach(theme.currentStyle.commonUse, id: \.self) { item in
                                    Chip(text: item)
                                }
                            }
                            .padding(.vertical, 2)
                        }
                        .scrollIndicators(.hidden)
                    }

                    section(title: "Influences") {
                        ScrollView(.horizontal) {
                            HStack(spacing: 8) {
                                ForEach(theme.currentStyle.influences, id: \.self) { item in
                                    Chip(text: item)
                                }
                            }
                            .padding(.vertical, 2)
                        }
                        .scrollIndicators(.hidden)
                    }

                    section(title: "Style primitives") {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(alignment: .top, spacing: 12) {
                                Text("Shapes")
                                    .font(.system(size: 13, weight: .semibold))
                                    .frame(width: 90, alignment: .leading)
                                    .foregroundStyle(.black.opacity(0.75))

                                ScrollView(.horizontal) {
                                    HStack(spacing: 8) {
                                        ForEach(theme.currentStyle.shapes.map(\.rawValue), id: \.self) { item in
                                            Chip(text: item)
                                        }
                                    }
                                    .padding(.vertical, 2)
                                }
                                .scrollIndicators(.hidden)
                            }

                            HStack(alignment: .top, spacing: 12) {
                                Text("Texture")
                                    .font(.system(size: 13, weight: .semibold))
                                    .frame(width: 90, alignment: .leading)
                                    .foregroundStyle(.black.opacity(0.75))

                                Chip(text: theme.currentStyle.texture.rawValue)
                            }

                            HStack(alignment: .top, spacing: 12) {
                                Text("Typography")
                                    .font(.system(size: 13, weight: .semibold))
                                    .frame(width: 90, alignment: .leading)
                                    .foregroundStyle(.black.opacity(0.75))

                                Text(theme.currentStyle.typography)
                                    .font(.system(size: 14))
                                    .foregroundStyle(.black.opacity(0.75))
                            }
                        }
                    }

                    section(title: "Colors") {
                        HStack(spacing: 10) {
                            ForEach(Array(theme.currentStyle.colors.enumerated()), id: \.offset) { _, c in
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(c)
                                    .frame(width: 44, height: 44)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black.opacity(0.08), lineWidth: 1)
                                    )
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .scrollIndicators(.hidden)
        }
        .navigationTitle(theme.currentStyle.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private func section<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.black)
            content()
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.86))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.black.opacity(0.06), lineWidth: 1)
        )
    }
}

private struct Chip: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.system(size: 12, weight: .semibold))
            .foregroundStyle(.black.opacity(0.85))
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(
                RoundedRectangle(cornerRadius: 999)
                    .fill(Color.black.opacity(0.06))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 999)
                    .stroke(Color.black.opacity(0.06), lineWidth: 1)
            )
    }
}

