//
//  DesignPediqApp.swift
//  DesignPediq
//
//  Created by Marie on 18/02/2026.
//

import SwiftUI
import SwiftData

@main
struct DesignPediqApp: App {
    
    @State private var theme = ThemeEnvironment(
        initialStyle: DesignStyles.shared.skeuomorphism
    )

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(theme)
        }
    }
}
