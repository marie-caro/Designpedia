//
//  ContentView.swift
//  DesignPedia
//
//  Created by Marie on 18/02/2026.
//

import SwiftUI

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

            ScrollView {
                VStack(spacing: 18) {
                    HStack(alignment: .center, spacing: 16) {
                        theme.currentStyle.textView()
                            .foregroundStyle(Color.black)
                            .fixedSize()
                        Spacer(minLength: 12)
                        theme.currentStyle.clockView()
                    }
                    .frame(maxWidth: .infinity, alignment: .top)
                    VStack(spacing: 18) {
                        theme.currentStyle.widgetsView()
                        theme.currentStyle.drawView()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, 12)
                .padding(.vertical, 16)
            }
            .scrollIndicators(.hidden)
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
                } else if selectedView == 1 {
                    HistoryView()
                } else if selectedView == 2 {
                    GeneralInfoView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button("Basics") {
                            selectedView = 2
                        }
                        Spacer()
                        Button("History") {
                            selectedView = 1
                        }
                        Spacer()
                        Button("Change Style") {
                            changeStyle()
                        }
                        Spacer()
                        Button("Design") {
                            selectedView = 0
                        }
                    }
                    .padding(.horizontal)
                    .tint(.black)
                }
            }
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
