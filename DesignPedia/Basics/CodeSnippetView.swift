import SwiftUI

struct CodeSnippetView: View {
    let title: String?
    let code: String

    @State private var didCopy: Bool = false

    init(title: String? = nil, code: String) {
        self.title = title
        self.code = code
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let title {
                Text(title)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(.secondary)
            }

            Text(code)
                .font(.system(size: 13))
                .fontDesign(.monospaced)
                .textSelection(.enabled)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack {
                Spacer()
                Button {
                    UIPasteboard.general.string = code
                    didCopy = true
                    Task {
                        try? await Task.sleep(for: .seconds(1.1))
                        didCopy = false
                    }
                } label: {
                    Text(didCopy ? "Copied ✓" : "Copy")
                        .font(.system(size: 13, weight: .semibold))
                }
                .buttonStyle(.bordered)
            }
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.black.opacity(0.05))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color.black.opacity(0.06), lineWidth: 1)
        )
    }
}

