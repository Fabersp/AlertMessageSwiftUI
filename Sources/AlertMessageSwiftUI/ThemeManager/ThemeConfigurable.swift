//
//  ThemeConfigurable.swift
//  MessageUIKit
//
//  Created by Fabricio Padua on 1/13/25.
//

import SwiftUI

public protocol ThemeConfigurable {
    var primaryButtonStyle: ThemeManager.ButtonStyle { get }
    var secondaryButtonStyle: ThemeManager.ButtonStyle { get }
    var cancelButtonStyle: ThemeManager.ButtonStyle { get }
    var titleConfig: ThemeManager.TextConfig { get }
    var descriptionConfig: ThemeManager.TextConfig { get }
    var backgroundConfig: ThemeManager.BackgroundConfig { get }
    func backgroundStyle(for colorScheme: ColorScheme) -> AnyView
}
