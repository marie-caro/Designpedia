//
//  ContentView.swift
//  DesignPediq
//
//  Created by Marie on 18/02/2026.
//

import SwiftUI
import SwiftData
import Observation

struct HistoryView: View {
    @Environment(ThemeEnvironment.self) private var theme

    var body: some View {
        ScrollView {
            VStack {
                Text("Year: " + theme.currentStyle.originYear)
                Text(theme.currentStyle.description)
                Divider()
                Text(theme.currentStyle.context)
                Divider()
                Text("Influenced by...")
                ForEach(theme.currentStyle.influences, id: \.self) { item in
                    Text(item)
                }
                Divider()
                Text("Typography: " + theme.currentStyle.typography)
                Divider()
                Text("Colors: ")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding(.leading)
                ForEach(theme.currentStyle.colors, id: \.self) { item in
                    Text(item.description)
                }
                Divider()
                Text("Shapes: ")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding(.leading)
                ForEach(theme.currentStyle.shapes, id: \.self) { item in
                    Text(item.rawValue)
                }
                Text(theme.currentStyle.texture.rawValue)

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .navigationTitle(theme.currentStyle.name)
#if os(iOS) || os(tvOS) || os(watchOS)
        .navigationBarTitleDisplayMode(.inline)
#endif
    }
}

struct DesignView: View {
    @Environment(ThemeEnvironment.self) private var theme

    var body: some View {
        VStack {
            Text(theme.currentStyle.name)
            Text(theme.currentStyle.description)
        }
    }
}


struct ContentView: View {
    @State private var selectedView: Int = 0
    @State private var styleIndex: Int = 0
    @Environment(ThemeEnvironment.self) private var theme
    
    private let styles = [
        DesignStyles.shared.glassmorphism,
        DesignStyles.shared.neumorphism,
        DesignStyles.shared.flatDesign,
        DesignStyles.shared.skeuomorphism,
        DesignStyles.shared.neobrutalism,
        DesignStyles.shared.claymorphism,
        DesignStyles.shared.materialDesign
    ]
    
    var body: some View {
        NavigationStack {
            Group {
                if selectedView == 0 {
                    HistoryView()
                } else {
                    DesignView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button("History") { selectedView = 0 }
                        Spacer()
                        Button("Change Style") { changeStyle() }
                        Spacer()
                        Button("Design") { selectedView = 1 }
                    }
                    .padding(.horizontal)
                }
            }
            .foregroundColor(theme.currentStyle.colors.first)
        }
    }
    private func changeStyle() {
        styleIndex = (styleIndex + 1) % styles.count
        theme.currentStyle = styles[styleIndex]
    }
}

#Preview {
    ContentView()
        .environment(
            ThemeEnvironment(
                initialStyle: DesignStyles.shared.skeuomorphism
            )
        )
}
