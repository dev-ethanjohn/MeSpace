//
//  BlurType.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/23/24.
//

import Foundation
import SwiftUI

enum BlurType {
    case freestyle
    case light
    case dark
    case extraLight
    
    var uiBlurStyle: UIBlurEffect.Style {
        switch self {
        case .freestyle:
            return .regular
        case .light:
            return .light
        case .dark:
            return .dark
        case .extraLight:
            return .extraLight
        }
    }
}


struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
