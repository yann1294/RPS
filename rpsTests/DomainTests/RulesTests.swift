//
//  RulesTests.swift
//  rps
//
//  Created by Mimi_Son on 06/10/25.
//



import Testing
@testable import rps

@Suite("Rules")
struct RulesTests {
    @Test("evaluate() outcomes")
    func evaluate() {
        let rules = StandardRules()
        #expect(rules.evaluate(.rock, .scissors) == .win)
        #expect(rules.evaluate(.rock, .paper) == .lose)
        #expect(rules.evaluate(.rock, .rock) == .draw)
        #expect(rules.evaluate(.paper, .rock) == .win)
        #expect(rules.evaluate(.scissors, .paper) == .win)
    }
}
