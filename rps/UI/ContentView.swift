//
//  ContentView.swift
//  rps
//
//  Created by Mimi_Son on 05/10/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = GameViewModel(
        stats: UserDefaultsStatsStore() // remove if you don't want persistence yet
    )

    var body: some View {
        ZStack {
            Theme.bg.ignoresSafeArea()

            VStack(spacing: 20) {
                // Header
                VStack(spacing: 6) {
                    Text("Rock · Paper · Scissors")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                    Text("Round \(vm.roundIndex)")
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 8)

                // Scoreboard
                HStack(spacing: 16) {
                    ScoreCard(title: "You", score: vm.playerScore)
                    ScoreCard(title: "CPU", score: vm.cpuScore)
                }
                .padding(.vertical, 4)

                // Arena
                VStack(spacing: 14) {
                    Text("Arena")
                        .font(.headline)
                        .foregroundStyle(.secondary)

                    HStack(spacing: 28) {
                        MoveDisplay(title: "You", emoji: vm.lastRound?.player.emoji ?? "❔")
                        Text("vs").font(.title3.bold()).padding(.horizontal, 6)
                        MoveDisplay(title: "CPU", emoji: vm.lastRound?.cpu.emoji ?? "❔")
                    }

                    ResultBanner(result: vm.lastRound?.result, pulse: vm.showResultPulse)
                        .padding(.top, 6)
                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                .shadow(radius: 6, y: 3)

                // Controls
                VStack(spacing: 12) {
                    Text("Pick your move").font(.headline)

                    HStack(spacing: 14) {
                        ForEach(Move.allCases) { move in
                            MoveButton(move: move) { vm.play($0) }
                        }
                    }
                }
                .padding(.horizontal)

                // Reset
                Button(role: .destructive) { vm.reset() } label: {
                    Label("Reset Game", systemImage: "arrow.counterclockwise")
                        .font(.subheadline.weight(.semibold))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                }
                .padding(.bottom, 8)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
