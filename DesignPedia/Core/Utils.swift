//
//  Utils.swift
//  DesignPedia
//
//  Created by Marie on 22/02/2026.
//
import SwiftUI

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

extension Color {
    static let retroYellow = Color(uiColor: .retroYellow)
    static let retroPink = Color(uiColor: .retroPink)
    static let retroLightPink = Color(uiColor: .retroLightPink)
    static let retroDarkPink = Color(uiColor: .retroDarkPink)
}

extension UIColor {
    static let retroYellow = UIColor(hex: "#F4C400")
    static let retroPink = UIColor(hex: "#F06292")
    static let retroLightPink = UIColor(hex: "#F48FB1")
    static let retroDarkPink = UIColor(hex: "#D81B60")
}

extension UIColor {
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        if hex.hasPrefix("#") { scanner.currentIndex = hex.index(after: hex.startIndex) }

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = CGFloat((rgb >> 16) & 0xFF) / 255
        let g = CGFloat((rgb >> 8) & 0xFF) / 255
        let b = CGFloat(rgb & 0xFF) / 255

        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}

struct StylePickerMenu: View {
    @Environment(ThemeEnvironment.self) private var theme

    var body: some View {
        Menu {
            Button("Neumorphism") {
                theme.currentStyle = Neumorphism()
            }
            Button("Glassmorphism") {
                theme.currentStyle = Glassmorphism()
            }
            Button("Neobrutalism") {
                theme.currentStyle = Neobrutalism()
            }
            Button("FlatDesign") {
                theme.currentStyle = FlatDesign()
            }
            Button("Skeuomorphism") {
                theme.currentStyle = Skeuomorphism()
            }
        } label: {
            Image(systemName: "ellipsis.circle")
        }
        .menuStyle(.button)
        .buttonStyle(.plain)
    }
}
