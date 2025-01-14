//
//  PackageThemeManager.swift
//  MessageUIKit
//
//  Created by Fabricio Padua on 1/10/25.
//

import SwiftUI

// Theme manager for package-level configurations
public struct PackageThemeManager: ThemeConfigurable {
    public var primaryButtonStyle: ThemeManager.ButtonStyle
    public var secondaryButtonStyle: ThemeManager.ButtonStyle
    public var cancelButtonStyle: ThemeManager.ButtonStyle
    public var titleConfig: ThemeManager.TextConfig
    public var descriptionConfig: ThemeManager.TextConfig
    public var backgroundConfig: ThemeManager.BackgroundConfig
    
    public init(
        primaryButtonStyle: ThemeManager.ButtonStyle = ThemeManager.ButtonStyle.primary,
        secondaryButtonStyle: ThemeManager.ButtonStyle = ThemeManager.ButtonStyle.secondary,
        cancelButtonStyle: ThemeManager.ButtonStyle = ThemeManager.ButtonStyle.cancel,
        titleConfig: ThemeManager.TextConfig = ThemeManager.TextConfig.titleConfig,
        descriptionConfig: ThemeManager.TextConfig = ThemeManager.TextConfig.descriptionConfig,
        backgroundConfig: ThemeManager.BackgroundConfig = ThemeManager.defaultBackground
    ) {
        self.primaryButtonStyle = primaryButtonStyle
        self.secondaryButtonStyle = secondaryButtonStyle
        self.cancelButtonStyle = cancelButtonStyle
        self.titleConfig = titleConfig
        self.descriptionConfig = descriptionConfig
        self.backgroundConfig = backgroundConfig
    }
    
    public func backgroundStyle(for colorScheme: ColorScheme) -> AnyView {
        backgroundConfig.solidBackground(for: colorScheme) // Default solid background
    }
}
