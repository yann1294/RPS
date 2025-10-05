//
//  MoveButton.swift
//  rps
//
//  Created by Mimi_Son on 05/10/25.
//

import SwiftUI

struct MoveButton: View {
    let move: Move
    let action: (Move) -> Void

    var body: some View {
        Button {
            action(move)
        } label: {
            VStack(spacing: 6) {
                Text(move.emoji).font(.system(size: 44))
                Text(move.label).font(.subheadline.weight(.semibold))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        }
        .buttonStyle(ScaleOnPressStyle())
        .accessibilityLabel(Text(move.label))
    }
}

struct ScaleOnPressStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1)
            .animation(.spring(response: 0.25, dampingFraction: 0.7), value: configuration.isPressed)
    }
}
