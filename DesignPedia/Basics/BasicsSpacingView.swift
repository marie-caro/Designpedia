import SwiftUI

struct BasicsSpacingView: View {
    private let steps: [CGFloat] = [4, 8, 16, 24, 32, 48]

    @State private var rulerOffset: CGFloat = 0
    @State private var padding: CGFloat = 16

    private let twoCol = [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)]
    private let threeCol = [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)]

    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Drag the ruler to compare common spacing steps.")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(.secondary)

                    ruler
                }
                .padding(.vertical, 6)
            } header: {
                Text("Visual ruler")
            }

            Section {
                VStack(alignment: .leading, spacing: 12) {
                    cardWithPadding

                    LabeledContent("Padding") {
                        Text("\(Int(padding)) pt")
                            .foregroundStyle(.secondary)
                    }
                    Slider(value: $padding, in: 0...48, step: 1)

                    CodeSnippetView(
                        title: "SwiftUI snippet",
                        code: """
RoundedRectangle(cornerRadius: 16)
  .padding(\(Int(padding)))
"""
                    )
                }
                .padding(.vertical, 6)
            } header: {
                Text("Live padding demo")
            }

            Section {
                VStack(alignment: .leading, spacing: 12) {
                    Text("2-column grid")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(.secondary)
                    grid(twoCol, columns: 2)

                    CodeSnippetView(
                        title: "Snippet",
                        code: """
LazyVGrid(columns: [
  GridItem(.flexible(), spacing: 12),
  GridItem(.flexible(), spacing: 12)
], spacing: 12) { ... }
"""
                    )

                    Text("3-column grid")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(.secondary)
                        .padding(.top, 6)
                    grid(threeCol, columns: 3)

                    CodeSnippetView(
                        title: "Snippet",
                        code: """
LazyVGrid(columns: [
  GridItem(.flexible(), spacing: 12),
  GridItem(.flexible(), spacing: 12),
  GridItem(.flexible(), spacing: 12)
], spacing: 12) { ... }
"""
                    )
                }
                .padding(.vertical, 6)
            } header: {
                Text("Grid + gutters")
            }
        }
        .navigationTitle("Spacing")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var ruler: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.black.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.black.opacity(0.06), lineWidth: 1)
                )

            HStack(alignment: .bottom, spacing: 12) {
                ForEach(steps, id: \.self) { step in
                    VStack(alignment: .leading, spacing: 6) {
                        Text("\(Int(step))")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(.secondary)
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue.opacity(0.25))
                            .frame(width: step, height: 24)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue.opacity(0.25), lineWidth: 1)
                            )
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .offset(x: rulerOffset)
        }
        .frame(height: 92)
        .clipped()
        .gesture(
            DragGesture()
                .onChanged { value in
                    rulerOffset = value.translation.width
                }
        )
    }

    private var cardWithPadding: some View {
        ZStack {
            paddingCardBackground
            paddingCardContent
        }
        .frame(height: 140)
        .background(Color.black.opacity(0.03))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private var paddingCardBackground: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color.white)
            .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0, y: 6)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black.opacity(0.06), lineWidth: 1)
            )
    }

    private var paddingCardContent: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.green.opacity(0.18))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.green.opacity(0.25), lineWidth: 1)
            )
            .padding(padding)
            .overlay(alignment: .topLeading) {
                Text("Content")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(Color.green.opacity(0.9))
                    .padding(padding + 10)
            }
    }

    private func grid(_ columns: [GridItem], columns count: Int) -> some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(0..<(count * 2), id: \.self) { i in
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.orange.opacity(0.18))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.orange.opacity(0.25), lineWidth: 1)
                    )
                    .frame(height: 44)
                    .overlay(
                        Text("#\(i + 1)")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundStyle(.secondary)
                    )
            }
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.black.opacity(0.05))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.black.opacity(0.06), lineWidth: 1)
        )
    }
}

