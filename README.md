# TrekNepal 🏔️

TrekNepal is a Flutter mobile application UI project designed to help users explore trekking destinations in Nepal. The app provides a simple interface for discovering popular treks and viewing their details.

## 📱 Features

- **Welcome Screen:** Mountain background, app branding, and Get Started button.
- **Home Screen:** Greeting, search bar, featured trek, categories, and popular destinations.
- **Trip Details Screen:** Trek information, duration, difficulty, ratings, highlights, and sample pricing.
- **Reusable Widgets:** Destination cards and shared trek data models.
- **Navigation:** Navigate from the welcome screen to the home screen and individual trek details.
- **Local Images:** Display trekking images stored in the project's assets folder.

## 🛠️ Technologies Used

- Flutter
- Dart
- Material Design 3

## 📂 Project Structure

```text
trekking_nepal/
├── asset/
│   └── images/
├── lib/
│   ├── main.dart
│   ├── data/
│   │   └── trips.dart
│   ├── models/
│   │   └── trip.dart
│   ├── screens/
│   │   ├── welcome_screen.dart
│   │   ├── home_screen.dart
│   │   └── trip_details_screen.dart
│   └── widgets/
│       └── destination_card.dart
├── pubspec.yaml
└── README.md
```

## ⚙️ Requirements

- Flutter SDK
- Dart SDK compatible with the project
- Android Studio or Visual Studio Code
- An Android emulator, physical Android device, or Chrome browser

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone YOUR_GITHUB_REPOSITORY_URL
```

### 2. Open the project directory

```bash
cd trekking_nepal
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Run the application

```bash
flutter run
```

To run the application in Chrome:

```bash
flutter run -d chrome
```

## 🖼️ Image Assets

Place trekking images inside `asset/images/` and register the directory in `pubspec.yaml`.

Screenshots:
<img width="360" height="801" alt="image" src="https://github.com/user-attachments/assets/0b644487-2b03-4282-acf7-558cc9de6dce" />
<img width="353" height="797" alt="image" src="https://github.com/user-attachments/assets/0ffc5e75-24e1-4793-a47d-bd2619ec2621" />


Example:

```yaml
flutter:
  uses-material-design: true
  assets:
    - asset/images/
```

Make sure the image paths in the Dart files match the actual filenames.

## 📌 Current Project Status

This project is a UI prototype. Login, search filtering, saved treks, and booking are not yet connected to a backend. Trek ratings, prices, and descriptions are sample data.

## 👨‍💻 Author

Arun Bhul

## 📄 License

This project is for educational and learning purposes. Add a license file if you intend to distribute it under a specific open-source license.
