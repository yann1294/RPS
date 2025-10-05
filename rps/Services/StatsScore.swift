//
//  StatsScore.swift
//  rps
//
//  Created by Mimi_Son on 05/10/25.
//

import Foundation

public protocol StatsStoring {
    var totalRounds: Int { get set }
    var playerScore: Int { get set }
    var cpuScore: Int { get set }
    func reset()
}

public final class UserDefaultsStatsStore: StatsStoring {
    private let defaults: UserDefaults
    private enum Key {
        static let totalRounds = "stats.totalRounds"
        static let playerScore = "stats.playerScore"
        static let cpuScore    = "stats.cpuScore"
    }

    public init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    public var totalRounds: Int {
        get { defaults.integer(forKey: Key.totalRounds) }
        set { defaults.set(newValue, forKey: Key.totalRounds) }
    }
    public var playerScore: Int {
        get { defaults.integer(forKey: Key.playerScore) }
        set { defaults.set(newValue, forKey: Key.playerScore) }
    }
    public var cpuScore: Int {
        get { defaults.integer(forKey: Key.cpuScore) }
        set { defaults.set(newValue, forKey: Key.cpuScore) }
    }

    public func reset() {
        defaults.removeObject(forKey: Key.totalRounds)
        defaults.removeObject(forKey: Key.playerScore)
        defaults.removeObject(forKey: Key.cpuScore)
    }
}
