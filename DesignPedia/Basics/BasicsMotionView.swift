import SwiftUI

struct BasicsMotionView: View {
    @State private var trigger: Bool = false

    var body: some View {
        List {
            withVsWithoutSection
            animationGuideSection
        }
        .navigationTitle("Motion")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var withVsWithoutSection: some View {
        Section {
            HStack(spacing: 12) {
                MotionPanel(title: "No animation", isAnimated: false, trigger: trigger)
                MotionPanel(title: "Spring", isAnimated: true, trigger: trigger)
            }
            .frame(height: 150)
            .padding(.vertical, 6)

            Button("Trigger") { trigger.toggle() }
                .buttonStyle(.borderedProminent)

            CodeSnippetView(
                title: "Snippet",
                code: """
withAnimation(.spring()) {
  isOn.toggle()
}
"""
            )
            .listRowInsets(.init(top: 6, leading: 16, bottom: 6, trailing: 16))
        } header: {
            Text("With vs without animation")
        }
    }

    private var animationGuideSection: some View {
        Section {
            VStack(alignment: .leading, spacing: 12) {
                Text("Common SwiftUI animations")
                    .font(.system(size: 14, weight: .bold))

                guideRow(
                    ".linear(duration:)",
                    "Constant speed from start to end."
                )
                guideRow(
                    ".easeIn(duration:)",
                    "Starts slow, speeds up near the end."
                )
                guideRow(
                    ".easeOut(duration:)",
                    "Starts fast, slows down near the end."
                )
                guideRow(
                    ".easeInOut(duration:)",
                    "Smooth start and smooth finish."
                )
                guideRow(
                    ".spring(response:dampingFraction:blendDuration:)",
                    "Bouncy physical motion for playful interactions."
                )
                guideRow(
                    ".snappy / .smooth / .bouncy (iOS 17+)",
                    "Modern preset spring styles with cleaner tuning."
                )
            }
            .padding(.vertical, 6)

            CodeSnippetView(
                title: "How to use them",
                code: """
withAnimation(.easeInOut(duration: 0.25)) {
  isExpanded.toggle()
}

withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
  progress = 1
}
"""
            )
            .listRowInsets(.init(top: 6, leading: 16, bottom: 6, trailing: 16))
        } header: {
            Text("Animation guide")
        }
    }

    private func guideRow(_ title: String, _ detail: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(size: 13, weight: .semibold))
            Text(detail)
                .font(.system(size: 13))
                .foregroundStyle(.secondary)
        }
    }
}

private struct MotionPanel: View {
    let title: String
    let isAnimated: Bool
    let trigger: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(.secondary)

            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.black.opacity(0.05))
                Circle()
                    .fill(Color.blue.opacity(0.85))
                    .frame(width: 22, height: 22)
                    .offset(x: trigger ? 92 : 10)
                    .animation(isAnimated ? .spring(response: 0.45, dampingFraction: 0.75) : nil, value: trigger)
            }
            .frame(height: 60)
        }
        .padding(12)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.black.opacity(0.04))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.black.opacity(0.06), lineWidth: 1)
        )
    }
}

