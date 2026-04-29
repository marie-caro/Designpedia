import SwiftUI
import UIKit

struct BasicsColorView: View {
    @State private var selectedPalette = 0

    var body: some View {
        List {
            introSection
            relationshipsSection
            systemColorsSection
        }
        .navigationTitle("Color theory")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private var introSection: some View {
        Section {
            VStack(alignment: .leading, spacing: 12) {
                Text("Color is a fundamental tool in UI design. It creates hierarchy, communicates meaning, and guides user attention.")
                    .font(.system(size: 14))
                    .foregroundStyle(.primary)

                Text("Key principles:")
                    .font(.system(size: 14, weight: .semibold))

                VStack(alignment: .leading, spacing: 6) {
                    Text("• **Contrast** ensures readability and accessibility")
                    Text("• **Harmony** creates visual cohesion through color relationships")
                    Text("• **Consistency** helps users learn interface patterns")
                }
                .font(.system(size: 14))
                .foregroundStyle(.secondary)
            }
            .padding(.vertical, 4)
        }

        Section {
            VStack(alignment: .leading, spacing: 10) {
                Text("Color relationships")
                    .font(.system(size: 14, weight: .semibold))

                VStack(alignment: .leading, spacing: 6) {
                    Text("**Complementary**: Colors opposite on the color wheel (e.g., blue/orange). Creates high contrast and visual tension: useful for call-to-action buttons.")
                    Text("**Analogous**: Colors adjacent on the wheel (e.g., blue/cyan/green). Creates harmony and feels natural: common in nature-themed designs.")
                    Text("**Triadic**: Three colors evenly spaced (e.g., purple/orange/teal). Balanced yet vibrant: offers variety while maintaining cohesion.")
                }
                .font(.system(size: 13))
                .foregroundStyle(.secondary)
            }
            .padding(.vertical, 4)
        }
    }

    private var relationshipsSection: some View {
        Section {
            Picker("Palette", selection: $selectedPalette) {
                Text("Complementary").tag(0)
                Text("Analogous").tag(1)
                Text("Triadic").tag(2)
            }
            .pickerStyle(.segmented)

            HStack(spacing: 10) {
                ForEach(simplePalettes[selectedPalette].indices, id: \.self) { index in
                    let item = simplePalettes[selectedPalette][index]
                    RoundedRectangle(cornerRadius: 14)
                        .fill(item.color)
                        .frame(height: 72)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.black.opacity(0.10), lineWidth: 1)
                        )
                        .overlay(alignment: .bottomLeading) {
                            Text(item.label)
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundStyle(.white.opacity(0.95))
                                .padding(10)
                        }
                }
            }
            .padding(.vertical, 6)

            CodeSnippetView(
                title: "Snippet",
                code: "let colors = [Color.blue, Color.orange, Color.gray]"
            )
        } header: {
            Text("Relationships")
        }
    }

    private func hex(_ ui: UIColor) -> String {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        ui.getRed(&r, green: &g, blue: &b, alpha: &a)
        return String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
    }

    private var systemColorsSection: some View {
        Section {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                ForEach(systemColors) { item in
                    let ui = item.color
                    VStack(alignment: .leading, spacing: 6) {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color(uiColor: ui))
                            .frame(height: 46)
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.black.opacity(0.10), lineWidth: 1)
                            )
                        Text(item.name)
                            .font(.system(size: 12, weight: .semibold))
                        Text(hex(ui))
                            .font(.system(size: 12))
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding(.vertical, 6)

            CodeSnippetView(title: "Snippet", code: #"Color(.systemBlue)"#)
                .listRowInsets(.init(top: 6, leading: 16, bottom: 6, trailing: 16))
        } header: {
            Text("Apple system colors")
        }
    }

    private var simplePalettes: [[(label: String, color: Color)]] {
        [
            [("Base", .blue), ("Complement", .orange), ("Neutral", .gray)],
            [("Analogous", .blue), ("Base", .cyan), ("Analogous", .green)],
            [("Triad", .purple), ("Triad", .orange), ("Triad", .teal)],
        ]
    }

    private struct SystemColor: Identifiable {
        let id = UUID()
        let name: String
        let color: UIColor
    }

    private var systemColors: [SystemColor] {
        [
            .init(name: "systemBlue", color: .systemBlue),
            .init(name: "systemIndigo", color: .systemIndigo),
            .init(name: "systemPurple", color: .systemPurple),
            .init(name: "systemPink", color: .systemPink),
            .init(name: "systemRed", color: .systemRed),
            .init(name: "systemOrange", color: .systemOrange),
            .init(name: "systemYellow", color: .systemYellow),
            .init(name: "systemGreen", color: .systemGreen),
            .init(name: "systemMint", color: .systemMint),
            .init(name: "systemTeal", color: .systemTeal),
            .init(name: "systemCyan", color: .systemCyan),
            .init(name: "systemBrown", color: .systemBrown),
            .init(name: "systemGray", color: .systemGray),
        ]
    }
}
