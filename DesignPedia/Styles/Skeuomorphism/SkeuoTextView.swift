//
//  SkeuoTextView.swift
//  DesignPedia
//
//  Created by Marie on 24/02/2026.
//

import SwiftUI
import SwiftData
import Observation

struct SkeuoTextView: View {
    @State private var userInput: String = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 3)
                .stroke(
                    LinearGradient(
                        colors: [Color(white: 0.6), Color(white: 0.95)],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: 1
                )
                .fill(Color.gray.opacity(0.15).shadow(.inner(color: .gray.opacity(0.2), radius: 2, x: 0, y: 1)))
                .frame(width: 228, height: 38)
                .shadow(color: Color.white, radius: 4, x: 0, y: -10)

            TextField("Enter your secrets here...", text: $userInput)
                .frame(width: 230, height: 40)
                .padding(.leading)
                .textFieldStyle(PlainTextFieldStyle())
        }

    }
}
