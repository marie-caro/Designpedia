//
//  NeuTextView.swift
//  DesignPedia
//
//  Created by Marie on 24/02/2026.
//

import SwiftUI

struct NeuTextView: View {
    @State private var userInput: String = ""
    
    var body: some View {
        ZStack {            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
                .frame(width: 230, height: 40)
    
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white.shadow(.inner(color: .gray.opacity(0.2), radius: 2, x: 0, y: 1)))
                .frame(width: 228, height: 38)

            TextField("Enter your secrets here...", text: $userInput)
                .frame(width: 230, height: 40)
                .padding(.leading)
                .textFieldStyle(PlainTextFieldStyle())
        }
    }
}

