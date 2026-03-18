//
//  GlassWidgets.swift
//  DesignPedia
//
//  Created by Marie on 26/02/2026.
//

import SwiftUI
import SwiftData
import Observation

struct GlassWidgetView: View {
    @Environment(ThemeEnvironment.self) var theme

    var body: some View {
        Menu {
            Button("Neumorphism") { theme.currentStyle = Neumorphism() }
            Button("Glassmorphism") { theme.currentStyle = Glassmorphism() }
            Button("Neobrutalism") { theme.currentStyle = Neobrutalism() }
            Button("FlatDesign") { theme.currentStyle = FlatDesign() }
            Button("Skeuomorphism") { theme.currentStyle = Skeuomorphism() }
        } label: {
            Image(systemName: "ellipsis.circle")
        }
    }
}
