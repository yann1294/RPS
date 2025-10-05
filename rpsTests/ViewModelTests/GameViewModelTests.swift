//
//  GameViewModelTests.swift
//  rps
//
//  Created by Mimi_Son on 05/10/25.
//


import Testing
@testable import rps

@Suite("GameViewModel")
struct GameViewModelTests {

    @Test("Scoring with fixed CPU")
    @MainActor
    func scoringWithFixedCPU() {
        let vm = GameViewModel(
            rules: StandardRules(),
            rng: FixedMoveProvider(.scissors),
            haptics: NoopHaptics(),
            stats: nil
        )

        // rock beats scissors
        vm.play(.rock)

        #expect(vm.playerScore == 1)
        #expect(vm.cpuScore == 0)
        #expect(vm.history.count == 1)
        #expect(vm.history.last?.result == .win)
    }
}

