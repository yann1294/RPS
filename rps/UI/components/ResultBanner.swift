//
//  ResultBanner.swift
//  rps
//
//  Created by Mimi_Son on 05/10/25.
//

import SwiftUI

struct ResultBanner: View {
    let result: GameResult?
    let pulse: Bool

    private var banner: (text: String, icon: String, color: Color) {
        guard let r = result else { return ("Make a move", "hand.point.up.left.fill", .secondary) }
        switch r {
        case .win:  return (r.message, "checkmark.circle.fill", .green)
        case .lose: return (r.message, "xmark.circle.fill", .red)
        case .draw: return (r.message, "minus.circle.fill", .orange)
        }
    }

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: banner.icon)
            Text(banner.text).fontWeight(.semibold)
        }
        .font(.subheadline)
        .foregroundStyle(.white)
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background(banner.color.opacity(result == nil ? 0.35 : 0.9))
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        .scaleEffect(pulse ? 1.08 : 1.0)
        .accessibilityLabel(Text(banner.text))
    }
}


