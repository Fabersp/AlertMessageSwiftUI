//
//  MessageButton.swift
//  MessageUIKit
//
//  Created by Fabricio Padua on 1/7/25.
//

import SwiftUI

public struct MessageButton: Equatable {
    public let title: String
    public let style: ThemeManager.ButtonStyle
    public let action: () -> Void

    /// Initializer for `MessageButton`
    /// - Parameters:
    ///   - title: The title for the button.
    ///   - style: A `ThemeManager.ButtonStyle` to style the button.
    ///   - action: A closure to execute when the button is tapped.
    public init(
        title: String,
        style: ThemeManager.ButtonStyle,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.style = style
        self.action = action
    }

    /// Equatable conformance for `MessageButton`
    /// - Parameters:
    ///   - lhs: The left-hand `MessageButton` to compare.
    ///   - rhs: The right-hand `MessageButton` to compare.
    /// - Returns: A Boolean value indicating whether the two `MessageButton` instances are equal.
    public static func == (lhs: MessageButton, rhs: MessageButton) -> Bool {
        return lhs.title == rhs.title &&
            lhs.style == rhs.style
    }
}
