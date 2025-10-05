//
//  GameViewModel.swift
//  rps
//
//  Created by Mimi_Son on 05/10/25.
//

import Foundation
import Combine
import SwiftUI

@MainActor
final class GameViewModel: ObservableObject {
    // Inputs (dependencies)
    private let rules: GameRules
    private let rng: RandomMoveProvider
    private let haptics: Haptics
    private var stats: StatsStoring?
    
    // state
    @Published var playerScore = 0
     @Published var cpuScore = 0
     @Published var roundIndex = 1
     @Published var lastRound: Round?
     @Published var showResultPulse = false
     @Published var history: [Round] = []
    
    init(
        rules: GameRules,
        rng: RandomMoveProvider,
        haptics: Haptics,
        stats: StatsStoring? = nil
    ) {
        self.rules = rules
        self.rng = rng
        self.haptics = haptics
        self.stats = stats
        // hydrate from persistence if provided
        if let stats {
            self.playerScore = stats.playerScore
            self.cpuScore = stats.cpuScore
            self.roundIndex = max(1, stats.totalRounds + 1)
        }
    }

    convenience init(stats: StatsStoring? = nil) {
        self.init(
            rules: StandardRules(),
            rng: SystemRandomMoveProvider(),
            haptics: DefaultHaptics(),
            stats: stats
        )
    }
    
    func play(_ playerMove: Move) {
            let cpuMove = rng.pick()
            let result = rules.evaluate(playerMove, cpuMove)
            let round = Round(player: playerMove, cpu: cpuMove, result: result)
            lastRound = round
            history.append(round)

            switch result {
            case .win:  playerScore += 1; haptics.notify(.success)
            case .lose: cpuScore += 1;   haptics.notify(.error)
            case .draw:                 haptics.notify(.warning)
            }

            withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
                showResultPulse = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                withAnimation { self.showResultPulse = false }
            }

            roundIndex += 1
            stats?.totalRounds += 1
            stats?.playerScore = playerScore
            stats?.cpuScore = cpuScore
        }

        func reset() {
            playerScore = 0
            cpuScore = 0
            roundIndex = 1
            lastRound = nil
            history.removeAll()
            showResultPulse = false
            stats?.reset()
        }
}

