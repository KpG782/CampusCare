# CampusCare

Campus Care is a Flutter-based mobile guidance counseling application designed to provide accessible, on-demand mental health and counseling support to students of the University of Makati (UMak). Built in partnership with the UMak Counseling and Guidance Center Services (CGCS), Campus Care empowers students to:

- Track and visualize daily mood trends  
- Discover curated self-help resources  
- Book and manage appointments with certified counselors  
- Chat securely with counselors in real time  

## Table of Contents

- [Features](#features)
- [Architecture & Modules](#architecture--modules)
- [Technology Stack](#technology-stack)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Running the App](#running-the-app)
- [Usage](#usage)
- [Project Team](#project-team)
- [License](#license)

## Features

### Student Module

- **Account & Authentication**  
  Login/register with UMak email; secure session management and email verification.
- **Mood Tracking**  
  Daily check-ins with interactive visual charts and history logs.
- **Appointment Booking**  
  Browse counselor profiles, view availability, and book or cancel sessions.
- **Self-Help Resources**  
  Curated articles, videos, and interactive exercises on stress management, study skills, and more.
- **Real-Time Messaging**  
  Encrypted chat interface for quick follow-ups and questions.

### Admin Module

- **Counselor Management**  
  Create, update, or remove counselor profiles, schedules, and specializations.
- **Appointment Dashboard**  
  Approve, reschedule, or cancel appointments in real time.
- **Content Management**  
  Publish and update articles, events, and announcements.
- **Analytics & Reports**  
  Dashboard with mood-trend summaries, appointment metrics, and user engagement stats.

## Architecture & Modules

```
FlutterFlow + Firebase
│
├─ Authentication (Firebase Auth)
├─ Data Storage (Cloud Firestore)
├─ Serverless (Cloud Functions)
├─ File Hosting (Firebase Storage)
└─ UI / State Mgmt
   ├─ Student Screens
   └─ Admin Screens
```

## Technology Stack

- **Frontend**: Flutter & FlutterFlow  
- **Backend**: Firebase Auth, Firestore, Storage, Cloud Functions  
- **Design/Prototyping**: Figma  
- **CI/CD**: GitHub Actions, Firebase Hosting  
- **Testing**: Apache JMeter (performance), manual usability testing  

## Getting Started

### Prerequisites

- Flutter SDK ≥ 3.x  
- FlutterFlow account  
- Firebase project with Auth, Firestore & Storage enabled  
- IDE: Android Studio, VS Code, or IntelliJ IDEA  

### Installation

1. **Clone the repo**
   ```bash
   git clone https://github.com/YourOrg/CampusCare.git
   cd CampusCare
   ```

2. **Add Firebase config**  
   - Copy `google-services.json` → `android/app/`
   - Copy `GoogleService-Info.plist` → `ios/Runner/`

3. **Install dependencies**
   ```bash
   flutter pub get
   ```

### Running the App

#### Android

```bash
flutter run -d emulator-5554
```

#### iOS

```bash
flutter run -d <your-ios-device>
```

## Usage

- Sign up / sign in with your UMak email.
- Complete your profile (department, bio, picture).
- Log your mood in the Mood Tracker daily.
- Browse the Discovery section for CGCS info, counselor profiles, and services.
- Book or cancel appointments and chat with counselors.
- Access self-help articles under the Resources tab anytime.

## Project Team

| Name            | Role                               |
|-----------------|------------------------------------|
| Ken Garcia      | Project Leader & Content Strategist |
| Mars Maguddayao | Researcher                         |
| Timothy Forte   | Frontend Designer & Developer       |
| Lanz Corpuz     | Backend Developer                  |
| Brian Ashley    | QA Tester & Documentation          |

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.






