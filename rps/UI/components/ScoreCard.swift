//
//  ScoreCard.swift
//  rps
//
//  Created by Mimi_Son on 05/10/25.
//

import SwiftUI

struct ScoreCard: View {
    let title: String
        let score: Int

        var body: some View {
            VStack(spacing: 4) {
                Text(title).font(.caption).foregroundStyle(.secondary)
                Text("\(score)").font(.system(size: 34, weight: .bold, design: .rounded))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        }
}

