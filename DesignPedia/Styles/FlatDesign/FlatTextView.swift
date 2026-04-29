//
//  FlatTextView.swift
//  DesignPedia
//
//  Created by Marie on 24/02/2026.
//

import SwiftUI

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
            
            TextField("Enter your secrets here...", text: $userInput)
                .frame(width: 190, height: 40)
                .padding(.leading, 8)
                .textFieldStyle(.plain)
        }
    }
}

