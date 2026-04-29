import SwiftUI

struct BasicsHubView: View {
    var body: some View {
        List {
            Section {
                NavigationLink("Typography") { BasicsTypographyView() }
                NavigationLink("Spacing") { BasicsSpacingView() }
                NavigationLink("Color theory") { BasicsColorView() }
                NavigationLink("Motion") { BasicsMotionView() }
            } header: {
                Text("Fundamentals")
            }

            Section {
                NavigationLink("UI/UX History") { BasicsHistoryView() }
            } header: {
                Text("History")
            }
        }
        .tint(.black)
        .foregroundStyle(.black)
        .navigationTitle("Basics")
        .navigationBarTitleDisplayMode(.inline)
    }
}

