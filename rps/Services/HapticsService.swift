//
//  HapticsService.swift
//  rps
//
//  Created by Mimi_Son on 05/10/25.
//

import UIKit

public protocol Haptics {
    func notify(_ type: UINotificationFeedbackGenerator.FeedbackType)
}

public struct DefaultHaptics: Haptics {
    public init() {}
    public func notify(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        let gen = UINotificationFeedbackGenerator()
        gen.notificationOccurred(type)
    }
}

public struct NoopHaptics: Haptics { // For tests/previews
    public init() {}
    public func notify(_ type: UINotificationFeedbackGenerator.FeedbackType) {}
}
