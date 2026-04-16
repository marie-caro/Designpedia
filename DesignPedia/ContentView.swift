//
//  ContentView.swift
//  DesignPediq
//
//  Created by Marie on 18/02/2026.
//

import SwiftUI
import SwiftData
import Observation

struct DesignView: View {
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

            VStack {
                HStack(spacing: 50) {
                    VStack() {
                        theme.currentStyle.textView()
                            .foregroundStyle(Color.black)
                            .fixedSize()
                        theme.currentStyle.drawView()
                    }
                    VStack() {
                        theme.currentStyle.clockView()
                        theme.currentStyle.widgetsView()
                    }
                }
                .padding(.horizontal, 20)
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .navigationTitle(theme.currentStyle.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
struct HistoryView: View {
    @Environment(ThemeEnvironment.self) private var theme

    var body: some View {
        ScrollView {
            VStack {
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .navigationTitle(theme.currentStyle.name)
        .navigationBarTitleDisplayMode(.inline)

    }
}

struct ContentView: View {
    @State private var selectedView: Int = 0
    @State private var styleIndex: Int = 0
    @Environment(ThemeEnvironment.self) private var theme
    
    private let styles: [any DesignStyle] = [
        Neumorphism(),
        Skeuomorphism(),
        Glassmorphism(),
        FlatDesign(),
        Neobrutalism(),
    ]
    
    var body: some View {
        NavigationStack {
            Group {
                if selectedView == 0 {
                    DesignView()
                } else {
                    HistoryView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button("History") { selectedView = 1 }
                        Spacer()
                        Button("Change Style") { changeStyle() }
                        Spacer()
                        Button("Design") { selectedView = 0 }
                    }
                    .padding(.horizontal)
                }
            }
            .foregroundColor(theme.currentStyle.colors.first)
        }
    }
    private func changeStyle() {
        let next = (styleIndex + 1) % styles.count
        styleIndex = next
        theme.currentStyle = styles[next]
    }
}

#Preview {
    ContentView()
        .environment(
            ThemeEnvironment(
                initialStyle: Neumorphism()
            )
        )
}
