# **AlertMessageSwiftUI**

**AlertMessageSwiftUI** is a SwiftUI-based package designed to provide a configurable and customizable system for presenting alert messages with dynamic buttons and themes.

---

## **Features**

- Fully customizable themes for messages, buttons, and backgrounds.
- Supports light and dark modes.
- Dynamic buttons (`primary`, `secondary`, `cancel`) with configurable actions.
- Multiple message types with support for custom content.

---

## **Installation**

### **Swift Package Manager (SPM)**

1. Open your Xcode project.
2. Navigate to **File > Add Packages**.
3. Paste the following URL in the search bar:
   ```
   https://github.com/Fabersp/AlertMessageSwiftUI
   ```
4. Select the desired version and click **Add Package**.

---

## **Usage**

### **1. Import the Package**

In your Swift file, import `AlertMessageSwiftUI`:
```swift
import AlertMessageSwiftUI
```

---

### **2. Set Up `AppThemeManager`**

Create an instance of `AppThemeManager` to define app-specific styles:
```swift
import SwiftUI
import AlertMessageSwiftUI

public class AppThemeManager: ObservableObject, ThemeConfigurable {
    @Published public var primaryButtonStyle: ThemeManager.ButtonStyle
    @Published public var secondaryButtonStyle: ThemeManager.ButtonStyle
    @Published public var cancelButtonStyle: ThemeManager.ButtonStyle
    @Published public var titleConfig: ThemeManager.TextConfig
    @Published public var descriptionConfig: ThemeManager.TextConfig
    @Published public var backgroundConfig: ThemeManager.BackgroundConfig

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
        backgroundConfig.solidBackground(for: colorScheme)
    }
}
```

---

### **3. Add the Theme Manager to the Environment**

Update your app entry point (`App.swift`) to pass the theme manager as an environment object:
```swift
import SwiftUI
import AlertMessageSwiftUI

@main
struct MessageUIKitApp: App {
    private let appTheme = AppThemeManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appTheme)
        }
    }
}
```

---

### **4. Display Messages**

Use `MessageView` to display messages with buttons. Here's an example:
```swift
import SwiftUI
import AlertMessageSwiftUI

struct ContentView: View {
    @State private var activeMessageType: MessageType? = nil
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject var appTheme: AppThemeManager

    var body: some View {
        VStack(spacing: 10) {
            Text("Message Examples")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)

            // Example: Show Camera Permission Message
            Button(action: { activeMessageType = .cameraPermission }) {
                Text("Camera Permission")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .sheet(item: $activeMessageType) { messageType in
            MessageView(
                type: messageType,
                theme: appTheme,
                primaryButton: MessageButton(
                    title: "Allow",
                    style: appTheme.primaryButtonStyle,
                    action: { print("Primary action executed") }
                ),
                secondaryButton: MessageButton(
                    title: "Later",
                    style: appTheme.secondaryButtonStyle,
                    action: { print("Secondary action executed") }
                ),
                cancelButton: MessageButton(
                    title: "Cancel",
                    style: appTheme.cancelButtonStyle,
                    action: { print("Cancel action executed") }
                )
            )
        }
    }
}
```

---

### **5. Customize Themes**

You can easily customize the theme in your app by modifying `AppThemeManager`:
```swift
AppThemeManager(
    primaryButtonStyle: ThemeManager.ButtonStyle(background: .green, textColor: .white),
    secondaryButtonStyle: ThemeManager.ButtonStyle(background: .yellow, textColor: .black),
    cancelButtonStyle: ThemeManager.ButtonStyle(background: .red, textColor: .white),
    titleConfig: ThemeManager.TextConfig(font: .largeTitle, textColor: .blue),
    descriptionConfig: ThemeManager.TextConfig(font: .body, textColor: .gray),
    backgroundConfig: ThemeManager.BackgroundConfig(darkColor: .black, firstColor: .purple, secondColor: .blue)
)
```

---

## **Message Types**

`MessageUIKit` comes with pre-defined `MessageType`s. You can also create custom messages:
```swift
activeMessageType = .custom(
    image: "customImage",
    title: "Custom Title",
    description: "This is a custom description."
)
```

---

## **License**

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
"""
