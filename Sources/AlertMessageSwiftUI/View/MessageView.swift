    //
    //  MessageView.swift
    //  MessageUIKit
    //
    //  Created by Fabricio Padua on 1/7/25.
    //

import SwiftUI

/// A configurable view to display messages with dynamic themes and buttons
public struct MessageView: View {
    @Environment(\.colorScheme) private var colorScheme // Detect light/dark mode
    @Environment(\.dismiss) private var dismiss

    public let type: MessageType // Type of the message (with title, description, and image)
    public let primaryButton: MessageButton? // Primary button
    public let secondaryButton: MessageButton? // Secondary button
    public let cancelButton: MessageButton? // Cancel button
    public let theme: any ThemeConfigurable // Configurable theme for the package or app

    public init(
        type: MessageType,
        theme: any ThemeConfigurable = PackageThemeManager(), // Default package theme
        primaryButton: MessageButton? = nil,
        secondaryButton: MessageButton? = nil,
        cancelButton: MessageButton? = nil
    ) {
        self.type = type
        self.theme = theme
        self.primaryButton = primaryButton
        self.secondaryButton = secondaryButton
        self.cancelButton = cancelButton
    }

    public var body: some View {
        ZStack(alignment: .topTrailing) {
            // Dynamic background based on the theme
            theme.backgroundStyle(for: colorScheme)

            VStack(spacing: 20) {
                Spacer()
                // Image associated with the message type
                Image(type.image())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)

                // Dynamic title configuration
                Text(type.title())
                    .font(theme.titleConfig.font)
                    .fontWeight(theme.titleConfig.fontWeight)
                    .foregroundColor(theme.titleConfig.textColor)
                    .multilineTextAlignment(theme.titleConfig.multilineAlignment)
                    .padding(.horizontal)

                // Dynamic description configuration
                Text(type.description())
                    .font(theme.descriptionConfig.font)
                    .fontWeight(theme.descriptionConfig.fontWeight)
                    .foregroundColor(theme.descriptionConfig.textColor)
                    .multilineTextAlignment(theme.descriptionConfig.multilineAlignment)
                    .padding(.horizontal)

                // Button section
                buttonsSection()
                Spacer()
            }
            .padding(.horizontal, 20)

            // Close button
            Button(action: { dismiss() }) {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }

    /// Section to render configured buttons
    @ViewBuilder
    private func buttonsSection() -> some View {
        VStack(spacing: 10) {
            if let primaryButton = primaryButton { createButton(primaryButton) }
            if let secondaryButton = secondaryButton { createButton(secondaryButton) }
            if let cancelButton = cancelButton { createButton(cancelButton) }
        }
        .padding(.horizontal)
    }

    /// Creates a dynamic button based on the provided style
    private func createButton(_ button: MessageButton) -> some View {
        Button(action: button.action) {
            Text(button.title)
                .font(button.style.font)
                .foregroundColor(button.style.textColor)
                .padding()
                .frame(maxWidth: .infinity)
                .background(button.style.background)
                .cornerRadius(button.style.cornerRadius)
        }
    }
}
