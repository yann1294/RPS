//
//  RandomMoveProvider.swift
//  rps
//
//  Created by Mimi_Son on 05/10/25.
//

import Foundation


public protocol RandomMoveProvider {
    func pick() -> Move
}

public struct SystemRandomMoveProvider: RandomMoveProvider {
    public init() {}
    public func pick() -> Move { Move.allCases.randomElement()! }
}

// Test helper
public struct FixedMoveProvider: RandomMoveProvider {
    private let move: Move
    public init(_ move: Move) { self.move = move }
    public func pick() -> Move { move }
}
