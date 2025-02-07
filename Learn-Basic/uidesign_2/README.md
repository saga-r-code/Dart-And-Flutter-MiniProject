# Steps for adding App Icon and Splash Screen

## App Icon

1. Download any image
2. Add image to `assets` folder
3. Add package for app icon

    dev_dependencies:
    flutter_launcher_icons: ^0.14.3

    flutter_launcher_icons:
    android: true
    ios: true
    image_path: "assets/icon.png"
    remove_alpha_ios: true

4. Add `assets` folder to `pubspec.yaml`

    assets:
      - assets/

5. Run command: `flutter pub get`
6. Run command: `flutter pub run flutter_launcher_icons`

## Splash Screen

1. Download any image
2. Add image to `assets` folder
3. Add package for splash screen

    dev_dependencies:
    flutter_native_splash: ^2.2.11

    flutter_native_splash:
    color: "#FFFFFF"
    image: "assets/splash.jpg"
    android: true
    ios: true

4. Add `assets` folder to `pubspec.yaml`

    assets:
      - assets/

5. Run command: `flutter pub get`
6. Run command: `flutter pub run flutter_native_splash:create`

## If any error occurs during adding packages, run

    flutter clean
    flutter pub get
    and your command for packages

