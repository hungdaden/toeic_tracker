# May UI Kit 🎨

**May UI Kit** is an internal UI (User Interface) library tailored for the Flutter ecosystem (specifically for projects like Phoenix Smart School / SIS V2). The library provides reusable UI components and a standard Design System, making UI development faster, more consistent, and easier to maintain.

## 🌟 Key Features

- **Design Consistency:** Ensures all UI components, from Buttons and TextFields to Dialogs and Typography, strictly adhere to the common Design System.
- **Easy Customization:** The Theme system (Color, Typography, Shape) is clearly configured, supporting effortless customization.
- **Optimized Performance:** Components are structurally standardized, minimizing unnecessary rebuilds and delivering a smooth user experience.
- **Built-in Utilities:** Integrated with multi-language support (L10n), asset management (Assets generation via FlutterGen), and common extensions and utilities.

## 🚀 Getting Started

### 1. Installation

Add `may_uikit` to the `pubspec.yaml` of your main project:

```yaml
dependencies:
  may_uikit:
    path: ../packages/may-uikit # Adjust the relative path according to your project structure
```

Then run the following command:
```bash
flutter pub get
```

### 2. Setting up Theme & L10n

To apply the Design System from `May UI Kit` to your application, set up the Theme and Localizations Delegate at the top level of your app.

```dart
import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Awesome App',
      theme: MainTheme.lightTheme, // Use May UI Kit's theme
      localizationsDelegates: const [
        S.delegate, // L10n Delegate from UI Kit
        // ... add other delegates such as GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const MyHomePage(),
    );
  }
}
```

## 📚 Core Components

Below is a list of some of the main modules and components available in **May UI Kit**:

- **Views & Layouts:** `CommonScaffold`, `PagedView`, `KeyboardVisibilityBuilder`, ...
- **Inputs & Buttons:** `PrimaryTextField`, `CommonInkWell`, `HoverPressWidget`, ...
- **Typography & Image:** `CommonText`, `AssetGenImage`, `SvgGenImage`, ...
- **Popups & Dialogs:** `ConfirmDialog`, `ErrorDialog`, `MaintenanceModeDialog`, `CommonSnackBar`, ...
- **Loading Indicators:** `CommonProgressIndicator`, `Shimmer` (Circle, RoundedRectangle), ...

## 📂 Directory Structure

```text
may_uikit/
├── lib/
│   ├── common_views/    # Reusable and independent UI components (Button, Dialog, TextField...)
│   ├── resources/       # Resources: L10n, Color Configs, Typography, Dimens, Gen Assets...
│   ├── themes/          # Common Theme configurations (Light, Dark...)
│   ├── utils/           # Helper functions (DateTime, Object, View, Format...)
│   ├── extensions/      # Dart Extensions for quick operations
│   └── may_uikit.dart   # Main export file
```

## 🛠 Contributing

When developing new features or components for **May UI Kit**, please follow these guidelines:
1. **Independence:** Components must not contain business logic specific to any application. Avoid calling APIs or accessing the database directly within the UI Kit.
2. **Adhere to Design System:** Always reuse `AppColor` and `AppTextStyle` instead of hardcoding color codes or font sizes.
3. **Auto-generate Code:** If you add new language files (in `.arb` files) or images/icons, remember to run the following command to regenerate the intermediate files (`assets.gen.dart`, `l10n.dart`):
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
4. **Code Format & Lint:** Ensure the code passes all rules in `analysis_options.yaml` (using `flutter analyze` and `dart format`).
