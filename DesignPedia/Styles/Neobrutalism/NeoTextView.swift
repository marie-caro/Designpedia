//
//  Untitled.swift
//  DesignPedia
//
//  Created by Marie on 24/02/2026.
//

import SwiftUI
import SwiftData
import Observation

struct NeoTextView: View {
    @State private var userInput: String = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.black)
                .offset(x: 6, y: 6)
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.retroPink)
                .frame(width: 230, height:40)
            TextField(" enter you secrets here...", text: $userInput)
        }
    }
}
