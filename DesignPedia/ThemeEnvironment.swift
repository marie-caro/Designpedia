//
//  ThemeEnvironment.swift
//  DesignPediq
//
//  Created by Marie on 18/02/2026.
//

import SwiftUI
import Observation

@Observable
class ThemeEnvironment {
    var currentStyle: any DesignStyle
    
    init(initialStyle: any DesignStyle) {
        self.currentStyle = initialStyle
    }
}
