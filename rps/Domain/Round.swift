//
//  Round.swift
//  rps
//
//  Created by Mimi_Son on 05/10/25.
//

import Foundation

public struct Round: Equatable, Identifiable, Codable, Sendable {
    public let id: UUID
    public let date: Date
    public let player: Move
    public let cpu: Move
    public let result: GameResult

    public init(
        id: UUID = UUID(),
        date: Date = Date(),
        player: Move,
        cpu: Move,
        result: GameResult
    ) {
        self.id = id
        self.date = date
        self.player = player
        self.cpu = cpu
        self.result = result
    }
}
