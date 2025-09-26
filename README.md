# CampusCare
> **Empowering Student Well-being at University of Makati**

A beautifully crafted, AI-powered mobile guidance counseling app for University of Makati students—designed with FlutterFlow and Flutter. CampusCare combines secure mood tracking, instant AI-driven emotional insights, real-time counseling, and a rich library of self-help resources in a stunning, intuitive interface. Experience next-generation student well-being with seamless dark mode, smart analytics, and a caring digital companion—right in your pocket.

---

## 🌐 Live Demo (Web)

You can also try CampusCare directly in your browser:  
👉 [CampusCare Web Demo](https://campus-care-izsd1a.flutterflow.app/bLogin)

---

## 📱 Download (APK)

For Android devices, install the APK here:  
👉 [CampusCare APK (Google Drive)](https://drive.google.com/drive/u/2/folders/1RcX2Sduq-87-wtzQmxIjrcNhyXWUNMeN)

⚠️ **Note:** iOS build is not currently available due to Apple Developer Program requirements.

---

## 🚀 Test the App (Demo Account)

Want to explore CampusCare? Try logging in with our demo account:

- **Email:** lcorpuz.a12241569@umak.edu.ph  
- **Password:** 123BOIAmats!  

Feel free to navigate, test features, and experience the app as a student user!

---

## 🤖 AI-Powered Mood Insights

CampusCare leverages artificial intelligence to enhance student well-being. We have integrated a custom-trained DistilBERT model for mood summary and emotion classification, enabling:

- **Automated Mood Analysis:** Student mood logs are analyzed using a fine-tuned DistilBERT transformer, providing instant, intelligent feedback and summaries.  
- **Emotion Detection:** The AI can classify emotions such as sadness, joy, love, anger, fear, and surprise, helping counselors and students better understand emotional trends.  
- **Custom Model Training:** Our model was trained using the HuggingFace Transformers library and the [Fine-Tuning DistilBERT notebook](https://colab.research.google.com/drive/1g2-SgXIYfRwKsJXKmF87VHoONTWupvHs?authuser=2#scrollTo=OCHRSKdJPqwK), ensuring high accuracy and relevance for student mental health data.  

---

## 🌟 Key Features

### Student Experience
- Secure Account & Authentication  
- Mood Tracking & Visualization  
- AI-Powered Mood Summaries  
- Appointment Booking  
- Curated Self-Help Resources  
- Real-Time Messaging  
- Dark Mode Support  

### Admin & Counselor Tools
- Counselor Management  
- Appointment Dashboard  
- Content Management  
- Dark Mode Support  
- Analytics & Reports  

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

<p align="center">
  <img src="https://github.com/user-attachments/assets/e5ad238c-7410-4866-ba84-26963efac6aa" width="200" />
  <img src="https://github.com/user-attachments/assets/7b3e3345-e126-4b46-9ed3-55436770765d" width="200" />
  <img src="https://github.com/user-attachments/assets/9283d668-cc45-41de-a54f-4a06a83f1f7a" width="200" />
  <img src="https://github.com/user-attachments/assets/fe72d630-9fdf-4bca-92e2-a05deed3e08b" width="200" />
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/3b45c750-0b2d-40b6-8d5e-5d0d5f416079" width="200" />
  <img src="https://github.com/user-attachments/assets/9efc88f1-58a3-4696-852c-72acf912ae98" width="200" />
  <img src="https://github.com/user-attachments/assets/77dda2fc-3db7-4bb6-82e7-1b643be1892a" width="200" />
  <img src="https://github.com/user-attachments/assets/5f5a6c82-9d4a-4e8a-811f-4d22a7b3651a" width="200" />
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/a8a75a75-c0eb-4b71-b4f6-35617a0a2629" width="200" />
</p>

---

## 🎨 Design & Prototypes

Check out our Figma designs and prototypes here:  
👉 [CampusCare Figma Design](https://www.figma.com/design/uL8ySg520S6FQFeV7KKNOr/GUIDANCE-COUNSELING-APP?node-id=378-471)

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
  *(iOS build not deployed due to Apple Developer Program limitations)*

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

| Name            | Role                            |
| --------------- | ------------------------------- |
| Ken Garcia      | Project Leader & Full Stack Dev |
| Mars Maguddayao | Researcher                      |
| Timothy Forte   | Frontend Designer               |
| Lanz Corpuz     | Frontend/Backend Developer      |
| Brian Ashley    | QA Tester & Documentation       |

---

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

> *CampusCare: Designed with FlutterFlow. Engineered with Flutter & Dart. Enhanced by AI. Dedicated to student well-being.*

---

> **Notice:**
> Some features or integrations in this application may become deprecated or non-functional over time due to updates or changes in third-party services, APIs, or technology stacks (such as Flutter, Firebase, or AI libraries). Maintenance and updates may be limited if subscriptions or support for these services expire. For the latest compatibility, please refer to the official documentation of each technology used.
