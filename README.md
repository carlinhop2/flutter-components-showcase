# Flutter Components Showcase

![Flutter](https://img.shields.io/badge/Flutter-3.41-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.10+-0175C2?logo=dart)
![Platforms](https://img.shields.io/badge/Platforms-Android%20%7C%20iOS%20%7C%20Web-brightgreen)
![License](https://img.shields.io/badge/License-MIT-yellow)

A production-quality Flutter 3.41 component showcase app demonstrating Material 3 components across Android, iOS, and Web with clean architecture, fpdart, Riverpod, and Freezed.

---

## About

| Technology | Purpose |
|---|---|
| Flutter 3.41 / Dart 3.10+ | UI framework |
| fpdart ^1.1.0 | Functional programming (`Either`, `Option`, `TaskEither`) |
| flutter_riverpod ^2.5.1 + riverpod_annotation | State management |
| freezed_annotation ^2.4.1 + freezed | Immutable data models |
| go_router ^14.2.7 | Declarative routing |
| google_fonts ^6.2.1 | Inter font (Material 3) |

---

## Project Structure

```
lib/
├── main.dart                         # Entry point — ProviderScope + App
├── app.dart                          # MaterialApp.router with theme + router
└── src/
    ├── core/
    │   ├── router/
    │   │   └── app_router.dart       # GoRouter — all named routes
    │   ├── theme/
    │   │   └── app_theme.dart        # Light & dark ThemeData (Inter font)
    │   └── utils/
    │       └── result_extensions.dart # Failure types, Result<T>, helpers
    └── features/
        ├── showcase/                 # Home grid screen
        │   ├── domain/models/        # ComponentItem (Freezed)
        │   ├── data/repositories/   # InMemoryComponentRepository
        │   └── presentation/        # Providers, screens, widgets
        └── components/
            ├── buttons/
            ├── text_fields/
            ├── cards_and_lists/
            ├── dialogs_and_sheets/
            ├── navigation/
            ├── forms/
            ├── animations/
            ├── typography/
            └── colors_and_theming/
```

---

## Prerequisites

- **Flutter ≥ 3.22** (tested with 3.41)
- **Chrome** (for web development)
- **Android Studio** with an Android emulator or physical device
- **iOS**: requires macOS with Xcode 15+

---

## Installing Flutter

### macOS

```bash
# 1. Download the latest stable Flutter SDK
#    (replace the URL with the latest from https://docs.flutter.dev/release/archive)
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64_3.41.0-stable.tar.xz

# 2. Extract to your preferred location (~/development is recommended)
mkdir -p ~/development
tar -xf flutter_macos_arm64_3.41.0-stable.tar.xz -C ~/development

# 3. Add Flutter to your PATH — add this line to ~/.zshrc (or ~/.bash_profile)
echo 'export PATH="$HOME/development/flutter/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# 4. Verify the installation
flutter doctor
```

### Linux

```bash
# 1. Download the latest stable Flutter SDK
#    (replace the URL with the latest from https://docs.flutter.dev/release/archive)
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.41.0-stable.tar.xz

# 2. Extract to your preferred location (~/development is recommended)
mkdir -p ~/development
tar -xf flutter_linux_3.41.0-stable.tar.xz -C ~/development

# 3. Add Flutter to your PATH — add this line to ~/.bashrc (or ~/.zshrc)
echo 'export PATH="$HOME/development/flutter/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# 4. Verify the installation
flutter doctor
```

### Windows

```powershell
# 1. Download the latest stable Flutter SDK from:
#    https://docs.flutter.dev/release/archive
#    e.g. flutter_windows_3.41.0-stable.zip

# 2. Extract the zip to C:\src\flutter (or any path without spaces)

# 3. Add Flutter to your PATH permanently (run in PowerShell as Administrator)
[System.Environment]::SetEnvironmentVariable(
    "Path",
    $Env:Path + ";C:\src\flutter\bin",
    [System.EnvironmentVariableTarget]::User
)

# 4. Open a new terminal and verify the installation
flutter doctor
```

> **Tip:** `flutter doctor` checks your environment and lists any missing dependencies (Android SDK, Xcode, Chrome, etc.) with actionable fix instructions. Resolve all issues before proceeding.
>
> For the full official guide, see [docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install).

---

## Installation

```bash
# 1. Clone the repository
git clone https://github.com/carlinhop2/flutter-components-showcase.git
cd flutter-components-showcase

# 2. Fetch dependencies
flutter pub get

# 3. Generate code (Riverpod providers, Freezed models)
dart run build_runner build --delete-conflicting-outputs
```

> **Why aren't `*.g.dart` and `*.freezed.dart` committed?**  
> Generated files are excluded via `.gitignore` to keep the repository clean and avoid merge conflicts. Run `build_runner` once after cloning to regenerate them.

---

## Running the App

### Web (Ubuntu / any platform)
```bash
flutter run -d chrome
```

### Android
```bash
# List available devices / emulators
flutter devices

# Run on Android emulator or device
flutter run -d android
```

### iOS
> iOS builds require macOS + Xcode 15+.
```bash
flutter run -d ios
```

### Hot Reload / Restart

| Action | Terminal | VS Code | Android Studio |
|---|---|---|---|
| Hot reload | `r` | `Ctrl+F5` | `Ctrl+\` |
| Hot restart | `R` | `Shift+F5` | `Ctrl+Shift+\` |
| Quit | `q` | Close terminal | Stop button |

---

## Building for Release

```bash
# Android APK
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk

# Android App Bundle (Play Store)
flutter build appbundle --release
# Output: build/app/outputs/bundle/release/app-release.aab

# Web (JS)
flutter build web --release
# Output: build/web/

# Web (WebAssembly)
flutter build web --wasm
# Output: build/web/

# iOS (macOS only)
flutter build ios --release
# Output: build/ios/iphoneos/Runner.app
```

---

## Architecture

The app follows **Clean Architecture** organized by feature:

| Layer | Responsibility |
|---|---|
| **Domain** | Pure business models (Freezed), abstract repository interfaces |
| **Data** | Concrete repository implementations (in-memory for this showcase) |
| **Presentation** | Riverpod providers, screens, widgets |
| **Core** | Shared utilities: router, theme, fpdart helpers |

---

## Functional Programming with fpdart

### Result / Either typedef
```dart
typedef Result<T> = Either<Failure, T>;

// Repository returns Either — never throws
Result<List<ComponentItem>> getComponents() => Right(_components);
```

### Fold in UI
```dart
itemsResult.fold(
  (failure) => ErrorWidget(failure.message),
  (items)   => ItemGrid(items),
);
```

### Option — safe nullable access
```dart
Option<T> tryGetOption<T>(T Function() f) {
  try { return Some(f()); } catch (_) { return const None(); }
}
```

### TaskEither — async with error handling
```dart
TaskEither<Failure, T> taskEitherFromFuture<T>(Future<T> Function() f) =>
    TaskEither.tryCatch(f, (err, _) => UnexpectedFailure(err.toString()));
```

---

## Component Showcase Pages

| Screen | Route | Demonstrates |
|---|---|---|
| Home | `/` | Responsive grid (SliverGridDelegateWithMaxCrossAxisExtent), drawer |
| Buttons | `/buttons` | FilledButton, ElevatedButton, OutlinedButton, TextButton, IconButton (4 variants), FAB (4 sizes), SegmentedButton |
| Text Fields | `/text-fields` | Default, outlined, password toggle, required validation, disabled, multiline — all in Form |
| Cards & Lists | `/cards` | Card, Card.filled, Card.outlined, ListTile, ExpansionTile |
| Dialogs & Sheets | `/dialogs` | AlertDialog, showModalBottomSheet, floating SnackBar with action |
| Navigation | `/navigation` | NavigationBar, NavigationRail, scrollable TabBar |
| Forms | `/forms` | CheckboxListTile, SwitchListTile, Slider, DropdownMenu, DatePicker |
| Animations | `/animations` | AnimatedContainer, AnimatedOpacity, rotation, bounce, Hero transition |
| Typography | `/typography` | All 15 Material 3 text styles (Inter via Google Fonts) |
| Colors & Theming | `/colors` | Full ColorScheme palette with live light/dark toggle |

---

## Tech Stack

| Package | Version | Purpose |
|---|---|---|
| flutter_riverpod | ^2.5.1 | State management |
| riverpod_annotation | ^2.3.5 | Code-gen annotations |
| fpdart | ^1.1.0 | Functional types (Either, Option, TaskEither) |
| freezed_annotation | ^2.4.1 | Immutable models |
| json_annotation | ^4.9.0 | JSON serialization annotations |
| go_router | ^14.2.7 | Declarative routing |
| google_fonts | ^6.2.1 | Inter font |
| cupertino_icons | ^1.0.8 | iOS-style icons |
| build_runner | ^2.4.9 | Code generation runner |
| freezed | ^2.5.2 | Freezed code generator |
| json_serializable | ^6.7.6 | JSON code generator |
| riverpod_generator | ^2.4.0 | Riverpod code generator |
| riverpod_lint | ^2.3.10 | Riverpod lint rules |
| custom_lint | ^0.6.4 | Custom lint plugin host |
| flutter_lints | ^4.0.0 | Flutter lint rules |

---

## License

MIT © carlinhop2
