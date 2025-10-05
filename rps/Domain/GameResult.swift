//
//  GameResult.swift
//  rps
//
//  Created by Mimi_Son on 05/10/25.
//

import Foundation

public enum GameResult: Equatable, Sendable, Codable {
    case win,lose,draw
    
    public var message: String {
        switch self {
        case .win: return "You Win!"
        case .lose: return "You Lose!"
        case .draw: return "Draw!"
        }
    }
}
