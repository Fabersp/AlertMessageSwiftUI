//
//  ThemeManager.swift
//  MessageUIKit
//
//  Created by Fabricio Padua on 1/13/25.
//

import SwiftUI

/// Structure to manage shared theme configurations
public struct ThemeManager {
    
    // MARK: - Button Styles
    public struct ButtonStyle: Equatable {
        public let background: Color
        public let textColor: Color
        public let font: Font
        public let cornerRadius: CGFloat

        public init(
            background: Color = .blue,
            textColor: Color = .white,
            font: Font = .body,
            cornerRadius: CGFloat = 15
        ) {
            self.background = background
            self.textColor = textColor
            self.font = font
            self.cornerRadius = cornerRadius
        }

        public static let primary = ButtonStyle(
            background: .blue,
            textColor: .white,
            font: .callout,
            cornerRadius: 15
        )
        public static let secondary = ButtonStyle(
            background: .gray,
            textColor: .white,
            font: .body,
            cornerRadius: 15
        )
        public static let cancel = ButtonStyle(
            background: .red,
            textColor: .white,
            font: .callout,
            cornerRadius: 15
        )
    }

    // MARK: - Text Configurations
    public struct TextConfig {
        public let textColor: Color
        public let font: Font
        public let fontWeight: Font.Weight
        public let multilineAlignment: TextAlignment

        public init(
            textColor: Color = .primary,
            font: Font = .body,
            fontWeight: Font.Weight = .regular,
            multilineAlignment: TextAlignment = .leading
        ) {
            self.textColor = textColor
            self.font = font
            self.fontWeight = fontWeight
            self.multilineAlignment = multilineAlignment
        }

        public static let titleConfig = TextConfig(
            textColor: .primary,
            font: .title,
            fontWeight: .bold,
            multilineAlignment: .center
        )

        public static let descriptionConfig = TextConfig(
            textColor: .secondary,
            font: .body,
            fontWeight: .regular,
            multilineAlignment: .center
        )
    }

    // MARK: - Background Configurations
    public struct BackgroundConfig {
        public let darkColor: Color
        public let lightColor: Color
        public let gradientColors: [Color]

        public init(
            darkColor: Color = .black,
            lightColor: Color = .white,
            gradientColors: [Color] = [Color.blue, Color.white]
        ) {
            self.darkColor = darkColor
            self.lightColor = lightColor
            self.gradientColors = gradientColors
        }

        // Solid background
        public func solidBackground(for colorScheme: ColorScheme) -> AnyView {
            let backgroundColor = (colorScheme == .dark) ? darkColor : lightColor
            return AnyView(backgroundColor.edgesIgnoringSafeArea(.all))
        }

        // Gradient background
        public func gradientBackground(for colorScheme: ColorScheme) -> AnyView {
            return AnyView(
                LinearGradient(
                    gradient: Gradient(colors: gradientColors),
                    startPoint: .top,
                    endPoint: .bottom
                ).edgesIgnoringSafeArea(.all)
            )
        }

        // Radial gradient background
        public func radialGradientBackground(for colorScheme: ColorScheme) -> AnyView {
            return AnyView(
                RadialGradient(
                    gradient: Gradient(colors: gradientColors),
                    center: .center,
                    startRadius: 100,
                    endRadius: 400
                ).edgesIgnoringSafeArea(.all)
            )
        }
    }

    public static let defaultBackground = BackgroundConfig()
}
