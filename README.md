# 🐱 TOEIC Tracker & Mun AI - Smart Learning Assistant

Welcome to **TOEIC Tracker**, a comprehensive Flutter-based application designed to streamline your TOEIC preparation journey. Integrated with **Mun AI** (powered by Google Gemini), this app serves as both a score management tool and a personal study consultant.

---

## 🌟 Overview

TOEIC Tracker allows users to monitor their progress through intuitive charts, manage multiple profiles, and compete with friends. The highlight of the application is **Mun AI**, an intelligent cat assistant that analyzes your test history to provide personalized feedback and study strategies tailored to your specific score goals.

---

## 🚀 Key Features

- **Progress Tracking:** Log your Listening and Reading scores and visualize your improvement over time with dynamic line charts.
- **Mun AI Assistant:** A context-aware AI assistant that knows your name, target score, and your test results to offer the best advice.
- **Multi-User Support:** Easily switch between different user profiles with custom avatars and localized data.
- **Leaderboard:** Stay motivated by comparing your total scores and streaks with other users.
- **Modern UI/UX:** Features a sleek Dark Mode design with an animated curved navigation bar for a premium mobile experience.
- **Persistent Chat History:** Revisit your previous conversations with Mun AI through a convenient side drawer.

---

## 🛠 Developer Setup

To build and customize the application from source:

### 1. Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Stable channel).
- A Firebase project with Firestore and Storage enabled.
- Node.js (only required for Electron desktop packaging).

### 2. Configuration
The application uses `flutter_dotenv` for sensitive information.
- Create a `.env` file in the `assets/` directory.
- Add your Gemini API Key: `GEMINI_API_KEY=your_google_ai_studio_key`.

### 3. Running the App
```bash
flutter pub get
flutter run
```

### 4. Desktop Packaging (Electron)
The project includes an automated PowerShell script to easily build and package the desktop application (.exe) for Windows.

1. Ensure you are in the root directory (`toeic_tracker`).
2. Run the build script in PowerShell:
   ```powershell
   .\build_desktop.ps1
   ```
3. The script will automatically clean old builds, compile the Flutter Web app, transfer the necessary files, and package the application using Electron Builder.
4. Once completed successfully, you can find your `toeic-tracker-desktop Setup.exe` installer inside the `electron_app\release` directory.

---

## 📬 Contact & Support
If you encounter any issues or have feature suggestions, please feel free to open a GitHub Issue or reach out to the development team.

*Start your journey to 990 today!* 🚀
