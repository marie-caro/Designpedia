//  GlassTextView.swift
//  DesignPedia
//
//  Created by Marie on 24/02/2026.
//

import SwiftUI
import SwiftData
import Observation

struct GlassTextView: View {
    @State private var userInput: String = ""
    
    var body: some View {
        ZStack {
            // ESTO ES PARA VER GLASS, REMOVE? NO NECESARIO
            Rectangle()
                .fill(.red)
                .frame(width: 40, height:12)
    
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.1))
                .frame(width: 230, height: 40)
                .background(
                    BlurView(style: .systemUltraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.4), lineWidth: 1)
                )
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
            
            TextField("Enter your secrets here...", text: $userInput)
                .frame(width: 230, height: 40)
                .padding(.leading)
                .foregroundColor(.white.opacity(0.9))
                .textFieldStyle(PlainTextFieldStyle())
            
        }
    }
}
