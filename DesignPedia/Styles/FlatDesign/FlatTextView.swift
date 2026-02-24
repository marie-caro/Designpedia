//
//  FlatTextView.swift
//  DesignPedia
//
//  Created by Marie on 24/02/2026.
//

import SwiftUI
import SwiftData
import Observation

struct FlatTextView: View {
    @State private var userInput: String = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: 210, height: 40)
                .overlay(
                    Divider()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .offset(x: 0, y:10)
                        .padding(.bottom, 10),
                    alignment: .bottom
                )
            
            TextField(" enter you secrets here...", text: $userInput)
        }
    }
}

