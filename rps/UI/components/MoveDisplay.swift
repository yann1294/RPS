//
//  MoveDisplay.swift
//  rps
//
//  Created by Mimi_Son on 05/10/25.
//

import SwiftUI

struct MoveDisplay: View {
    let title: String
    let emoji: String

    var body: some View {
        VStack(spacing: 6) {
            Text(emoji).font(.system(size: 54))
            Text(title).font(.caption).foregroundStyle(.secondary)
        }
        .frame(width: 110, height: 110)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .shadow(radius: 3, y: 2)
    }
}

