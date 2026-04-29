import SwiftUI
import UIKit

struct BasicsTypographyView: View {
    private struct FontRow: Identifiable {
        let id = UUID()
        let label: String
        let style: Font.TextStyle
        let uiStyle: UIFont.TextStyle
        let snippet: String
    }

    private let rows: [FontRow] = [
        .init(label: "Caption2", style: .caption2, uiStyle: .caption2, snippet: #"Text("Hello").font(.caption2)"#),
        .init(label: "Caption", style: .caption, uiStyle: .caption1, snippet: #"Text("Hello").font(.caption)"#),
        .init(label: "Footnote", style: .footnote, uiStyle: .footnote, snippet: #"Text("Hello").font(.footnote)"#),
        .init(label: "Subheadline", style: .subheadline, uiStyle: .subheadline, snippet: #"Text("Hello").font(.subheadline)"#),
        .init(label: "Callout", style: .callout, uiStyle: .callout, snippet: #"Text("Hello").font(.callout)"#),
        .init(label: "Body", style: .body, uiStyle: .body, snippet: #"Text("Hello").font(.body)"#),
        .init(label: "Headline", style: .headline, uiStyle: .headline, snippet: #"Text("Hello").font(.headline)"#),
        .init(label: "Title3", style: .title3, uiStyle: .title3, snippet: #"Text("Hello").font(.title3)"#),
        .init(label: "Title2", style: .title2, uiStyle: .title2, snippet: #"Text("Hello").font(.title2)"#),
        .init(label: "Title", style: .title, uiStyle: .title1, snippet: #"Text("Hello").font(.title)"#),
        .init(label: "Large title", style: .largeTitle, uiStyle: .largeTitle, snippet: #"Text("Hello").font(.largeTitle)"#),
    ]

    var body: some View {
        List {
            Section {
                ForEach(rows) { row in
                    HStack(alignment: .firstTextBaseline, spacing: 12) {
                        Text(row.label)
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundStyle(.secondary)
                            .frame(width: 90, alignment: .leading)

                        Text("Hello, Dynamic Type")
                            .font(.system(row.style))
                            .foregroundStyle(.primary)

                        Spacer()
                    }
                    .contentShape(Rectangle())
                }
            }
        }
        .navigationTitle("Typography")
        .navigationBarTitleDisplayMode(.inline)
    }
}

