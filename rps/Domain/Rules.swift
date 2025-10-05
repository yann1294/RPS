//
//  Rules.swift
//  rps
//
//  Created by Mimi_Son on 05/10/25.
//

import Foundation

public protocol GameRules {
    func evaluate(_ player: Move, _ cpu: Move) -> GameResult
}

public struct StandardRules: GameRules {
    public init() {}
    public func evaluate(_ player: Move, _ cpu: Move) -> GameResult {
        if player == cpu { return .draw }
        switch (player, cpu) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            return .win
        default:
            return .lose
        }
    }
}
