# CampusCare

![CampusCare Banner]

> **Empowering Student Well-being at University of Makati**

CampusCare is a beautifully designed, FlutterFlow-powered mobile guidance counseling app, crafted to provide accessible, on-demand mental health and counseling support for students of the University of Makati (UMak). Developed in partnership with the UMak Counseling and Guidance Center Services (CGCS), CampusCare blends modern UI/UX with robust Flutter & Dart engineering to deliver a seamless, secure, and supportive experience for every student.

---

## 🤖 AI-Powered Mood Insights

CampusCare leverages artificial intelligence to enhance student well-being. We have integrated a custom-trained DistilBERT model for mood summary and emotion classification, enabling:

- **Automated Mood Analysis:** Student mood logs are analyzed using a fine-tuned DistilBERT transformer, providing instant, intelligent feedback and summaries.
- **Emotion Detection:** The AI can classify emotions such as sadness, joy, love, anger, fear, and surprise, helping counselors and students better understand emotional trends.
- **Custom Model Training:** Our model was trained using the HuggingFace Transformers library and the [Fine-Tuning DistilBERT notebook](https://colab.research.google.com/drive/1g2-SgXIYfRwKsJXKmF87VHoONTWupvHs?authuser=2#scrollTo=OCHRSKdJPqwK), ensuring high accuracy and relevance for student mental health data.

---

## 🌟 Key Features

### Student Experience

- **Secure Account & Authentication**  
  Sign in with your UMak email, manage your profile, and enjoy a safe, private environment.
- **Mood Tracking & Visualization**  
  Log your daily mood, reflect with interactive charts, and monitor your emotional journey.
- **AI-Powered Mood Summaries**  
  Receive instant, AI-generated insights and summaries of your mood logs.
- **Appointment Booking**  
  Browse counselor profiles, check real-time availability, and book or manage sessions with ease.
- **Curated Self-Help Resources**  
  Access articles, videos, and exercises on stress, study skills, and personal growth.
- **Real-Time Messaging**  
  Chat securely with certified counselors for guidance and support.

### Admin & Counselor Tools

- **Counselor Management**  
  Create, update, or remove counselor profiles, schedules, and specializations.
- **Appointment Dashboard**  
  Approve, reschedule, or cancel appointments instantly.
- **Content Management**  
  Publish and update articles, events, and announcements.
- **Analytics & Reports**  
  Visual dashboards for mood trends, appointments, and engagement metrics.

---

## 🏗️ Architecture & Modules

```
FlutterFlow + Flutter (Dart) + Firebase + AI (DistilBERT)
│
├─ Authentication (Firebase Auth)
├─ Data Storage (Cloud Firestore)
├─ Serverless Logic (Cloud Functions)
├─ File Hosting (Firebase Storage)
├─ AI Model Integration (DistilBERT for Mood Analysis)
└─ UI / State Management
   ├─ Student Screens
```

---

## 🚀 Technology Stack

- **Frontend:** Flutter, FlutterFlow
- **Backend:** Firebase Auth, Firestore, Storage, Cloud Functions
- **AI/ML:** Python, HuggingFace Transformers, DistilBERT, Colab
- **Design/Prototyping:** Figma, FlutterFlow
- **CI/CD:** GitHub Actions, Firebase Hosting
- **Testing:** Apache JMeter, manual usability testing

---

## 🖼️ Screenshots

> _Add your screenshots to `assets/screenshots/` and showcase the app here!_

---

## 🛠️ Getting Started

### Prerequisites

- Flutter SDK ≥ 3.x
- FlutterFlow account
- Firebase project (Auth, Firestore, Storage enabled)
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

- **Android:**
  ```bash
  flutter run -d emulator-5554
  ```
- **iOS:**
  ```bash
  flutter run -d <your-ios-device>
  ```

---

## 💡 Usage

- Sign up / sign in with your UMak email.
- Complete your profile (department, bio, picture).
- Log your mood in the Mood Tracker daily.
- Browse the Discovery section for CGCS info, counselor profiles, and services.
- Book or cancel appointments and chat with counselors.
- Access self-help articles under the Resources tab anytime.

---

## 👥 Project Team

| Name            | Role                                |
| --------------- | ----------------------------------- |
| Ken Garcia      | Project Leader & Content Strategist |
| Mars Maguddayao | Researcher                          |
| Timothy Forte   | Frontend Designer & Developer       |
| Lanz Corpuz     | Backend Developer                   |
| Brian Ashley    | QA Tester & Documentation           |

---

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

> _CampusCare: Designed with FlutterFlow. Engineered with Flutter & Dart. Enhanced by AI. Dedicated to student well-being._
