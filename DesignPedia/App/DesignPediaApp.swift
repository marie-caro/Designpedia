//
//  DesignPediaApp.swift
//  DesignPedia
//
//  Created by Marie on 18/02/2026.
//

import SwiftUI

@main
struct DesignPediaApp: App {

    @State private var theme = ThemeEnvironment(
        initialStyle: Neumorphism()
    )

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(theme)
                .preferredColorScheme(.light)
        }
    }
}
