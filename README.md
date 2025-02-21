# 🍺 onboard_er - A Flutter Onboarding Package

🚀 **onboard_er** is a modern and highly customizable Flutter onboarding package using **Flutter BLoC** and **Lottie animations**, designed to deliver an elegant and smooth onboarding experience.

![Onboarding Demo](https://github.com/Developeryilmaz/onboard_er/blob/main/README.md)  
*(Replace with an actual demo GIF or screenshot!)*

![Log_er Version](https://img.shields.io/badge/Version-0.1.0-blue) 
![License](https://img.shields.io/badge/License-MIT-green)

![Onboarding Banner](https://raw.githubusercontent.com/Developeryilmaz/onboard_er/refs/heads/main/doc/banner.png)

#                      Pharrax Software                  #

🚀 **onboard_er** is a clean and customizable Flutter onboarding package using **Flutter BLoC** and **Lottie animations**.

---

## 🎯 Features
✅ **Supports Flutter BLoC for state management**  
✅ **Lottie animations for engaging onboarding**  
✅ **Customizable navigation buttons & indicators**  
✅ **Clean architecture for scalability**  
✅ **Lightweight and easy to integrate** 🍺  

---

## 📦 Installation

### **1️⃣ Install from GitHub**
Add this to your `pubspec.yaml`:

```yaml
dependencies:
  onboard_er: [latest-version]
```

OR

### **2️⃣ Install from pub.dev** *(if published)*
```sh
flutter pub add onboard_er
```

---

## 🛠 Usage

### **1️⃣ Import the package**
```dart
import 'package:flutter/material.dart';
import 'package:onboard_er/onboard_er.dart';
```

### **2️⃣ Define Onboarding Pages**
```dart
final List<OnboardPageModel> onboardPages = [
  OnboardPageModel(
    title: "Welcome!",
    description: "This is an amazing onboarding experience.",
    animationUrl: "https://assets10.lottiefiles.com/packages/lf20_puciaact.json",
  ),
  OnboardPageModel(
    title: "Get Started",
    description: "Swipe to learn more about the app.",
    animationUrl: "https://assets10.lottiefiles.com/packages/lf20_rns6nqpy.json",
  ),
  OnboardPageModel(
    title: "You're Ready!",
    description: "Let's start using the app now.",
    animationUrl: "https://assets10.lottiefiles.com/packages/lf20_4qiz2d8z.json",
  ),
];
```

### **3️⃣ Use `OnboardScreen` in Your App**
```dart


import 'package:flutter/material.dart';
import 'package:log_er/log_er.dart';
import 'package:lottie/lottie.dart';
import 'package:onboard_er/onboard_er.dart';
import 'package:permission_handler/permission_handler.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding Example',
      // theme: ThemeData(primarySwatch: Colors.blue),
      theme: ThemeData.dark(),
      home: OnboardScreen(
        onCompleted: () async {
          await requestNotificationPermission();
          Log.debug('Onboarding Completed');
        },
        pages: pages.map((page) => OnboardPage(page: page)).toList(),
        btnColor: Colors.blue,
      ),
    );
  }

  Future<void> requestNotificationPermission() async {
    final status = await Permission.notification.request();
    if (status.isGranted) {
      Log.debug("Notification Permission Granted");
    } else {
      Log.debug("Notification Permission Denied");
    }
  }
}
  

final List<OnboardPageModel> pages = [
    OnboardPageModel(
    title: "Welcome!",
    description: "Experience a smooth and beautiful onboarding journey.",
    animationUrl:
        "https://assets10.lottiefiles.com/packages/lf20_jcikwtux.json",
  ),
  OnboardPageModel(
    title: "Fast & Efficient",
    description: "Quickly set up and get started with our amazing app.",
    animationUrl: "https://assets2.lottiefiles.com/packages/lf20_kkflmtur.json",
  ),
  OnboardPageModel(
    title: "Enable Notifications",
    description: "Stay updated with important notifications.",
    animationUrl: "https://assets1.lottiefiles.com/packages/lf20_3rwasyjy.json",
  ),
];

  class OnboardPage extends StatelessWidget {
  final OnboardPageModel page;

  const OnboardPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.network(
            page.animationUrl,
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Text(
            page.title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            page.description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}

```

---

## 🎨 Customization
You can **customize** colors, button styles, and more:

```dart
OnboardScreen(
  pages: onboardPages,
  onCompleted: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  },
  primaryColor: Colors.blue,    // Customize button colors
  secondaryColor: Colors.grey,  // Customize indicator colors
  backgroundColor: Colors.white, // Set background color
);
```

---

## 🤝 Contributing
Want to improve this package? 🍺 Fork the repo, create a branch, make changes, and submit a PR.

```sh
# Clone the repo
git clone https://github.com/Developeryilmaz/onboard_er.git
cd onboard_er

# Create a new branch
git checkout -b feature-new-ui

# Make changes and commit
git add .
git commit -m "Added new button styles"

# Push and create a Pull Request
git push origin feature-new-ui
```

---

## 📜 License
This package is available under the **Pharrax Software - YILMAZ ER** license.

```txt
Pharrax Software - YILMAZ ER

Permission is hereby granted, free of charge, to any person obtaining a copy of this software to deal in the Software without restriction...
```

---

### 📢 **If you like this package, don't forget to ⭐ star the repo!** 🍺