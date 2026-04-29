import SwiftUI

struct BasicsHistoryView: View {
    var body: some View {
        List {
            eraSection(
                title: "1970s–1980s: The Beginning",
                content: "Personal computing emerges. Xerox PARC introduces the GUI (1973). Interfaces mimic physical objects, buttons look like real buttons, switches look like switches. Limited by monochrome displays and low resolution.",
                keyPoints: ["Xerox Alto (1973)", "Apple Lisa (1983)", "Command-line interfaces"]
            )

            eraSection(
                title: "1990s: The Web Era",
                content: "The web goes mainstream. HTML provides basic hyperlinks and forms. Design is constrained by technology, slow connections, limited bandwidth. Tables and frames define layouts. Blue underlined links become universal.",
                keyPoints: ["First websites (1991)", "Netscape Navigator (1994)", "CSS introduced (1996)"]
            )

            eraSection(
                title: "2000s: Skeuomorphism",
                content: "As screens improve, interfaces mimic reality. Apple's iOS (2007) uses leather textures, stitched edges and realistic icons. Helps users transition from physical to digital. But realism becomes limiting as users gain digital literacy.",
                keyPoints: ["iOS 1–6 (2007–2013)", "Mac OS X Aqua", "Realistic textures and shadows"]
            )

            eraSection(
                title: "2010s: Flat Design",
                content: "Microsoft's Metro (2010) and Apple's iOS 7 (2013) reject skeuomorphism. Simple shapes, bold colors, no textures. Digital-native aesthetic. Accessibility improves: high contrast, clear typography. But 'flat' sometimes sacrifices usability for minimalism.",
                keyPoints: ["iOS 7 (2013)", "Material Design (2014)", "Responsive web design"]
            )

            eraSection(
                title: "2020s: Depth Returns",
                content: "Flat design matures. Subtle shadows, gradients, and blur effects add depth without realism. Neumorphism (2019) experiments with soft extrusion. Glassmorphism uses translucency. Neobrutalism rebels with bold, raw aesthetics. Eclectic era; multiple styles coexist.",
                keyPoints: ["Neumorphism (2019)", "Glassmorphism (2020)", "Neobrutalism (2020s)"]
            )

            Section {
                VStack(alignment: .leading, spacing: 8) {
                    Text("The pattern")
                        .font(.system(size: 14, weight: .semibold))

                    Text("UI design oscillates between **realism** and **abstraction**. When technology advances, realism peaks. When users gain digital literacy, abstraction wins. Today's designs blend both: flat foundations with subtle depth cues.")
                        .font(.system(size: 13))
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("UI/UX History")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private func eraSection(title: String, content: String, keyPoints: [String]) -> some View {
        Section {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.primary)

                Text(content)
                    .font(.system(size: 13))
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 4) {
                    ForEach(keyPoints, id: \.self) { point in
                        HStack(spacing: 6) {
                            Text("•")
                            Text(point)
                        }
                        .font(.system(size: 12))
                        .foregroundStyle(.tertiary)
                    }
                }
            }
            .padding(.vertical, 4)
        }
    }
}

#Preview {
    NavigationStack {
        BasicsHistoryView()
    }
}
