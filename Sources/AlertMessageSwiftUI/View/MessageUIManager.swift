//
//  MessageUIManager.swift
//  MessageUIKit
//
//  Created by Fabricio Padua on 1/7/25.
//

import SwiftUI

/// A manager for presenting `MessageView` with theme-based configurations.
public struct MessageUIManager {
    private let theme: any ThemeConfigurable

    /// Initializes the `MessageUIManager` with a specified theme.
    /// - Parameter theme: The theme to use for the manager. Defaults to `PackageThemeManager`.
    public init(
        theme: any ThemeConfigurable = PackageThemeManager()
    ) {
        self.theme = theme
    }

    /// Creates a `MessageView` with specified message type and button actions.
    /// - Parameters:
    ///   - type: The type of message to display.
    ///   - primaryAction: An optional closure for the primary button action.
    ///   - secondaryAction: An optional closure for the secondary button action.
    ///   - cancelAction: An optional closure for the cancel button action.
    /// - Returns: A configured `MessageView`.
    public func present(
        type: MessageType,
        primaryAction: (() -> Void)? = nil,
        secondaryAction: (() -> Void)? = nil,
        cancelAction: (() -> Void)? = nil
    ) -> MessageView {
        // Construct the `MessageButton` instances if actions are provided
        let primaryButton = primaryAction.map {
            MessageButton(
                title: "Allow",
                style: theme.primaryButtonStyle, // Use the theme's primary style
                action: $0
            )
        }

        let secondaryButton = secondaryAction.map {
            MessageButton(
                title: "Continue",
                style: theme.secondaryButtonStyle, // Use the theme's secondary style
                action: $0
            )
        }

        let cancelButton = cancelAction.map {
            MessageButton(
                title: "Cancel",
                style: theme.cancelButtonStyle, // Use the theme's cancel style
                action: $0
            )
        }

        // Return the configured `MessageView`
        return MessageView(
            type: type,
            theme: theme,
            primaryButton: primaryButton,
            secondaryButton: secondaryButton,
            cancelButton: cancelButton
        )
    }
}
