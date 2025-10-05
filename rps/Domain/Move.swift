//
//  Move.swift
//  rps
//
//  Created by Mimi_Son on 05/10/25.
//

import Foundation

public enum Move: String, CaseIterable, Identifiable, Codable, Sendable {
     case rock, paper, scissors
    public var id: Self { self }
    
    public var emoji: String {
        switch self {
        case .rock: return "🪨"
        case .paper: return "📄"
        case .scissors: return "✂️"
        }
    }
    
    public var label: String {
        rawValue.capitalized
    }
    
}
