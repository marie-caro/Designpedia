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
    var currentStyle: DesignStyle
    
    init(initialStyle: DesignStyle) {
        self.currentStyle = initialStyle
    }
}
