# 🍺 onboard_er - A Flutter Onboarding Package

![Onboarding Demo](https://github.com/Developeryilmaz/onboard_er/blob/main/README.md)  
*(Replace with an actual demo GIF or screenshot!)*

![Log_er Version](https://img.shields.io/badge/Version-0.1.0-blue) 
![License](https://img.shields.io/badge/License-MIT-green)

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
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardScreen(
        pages: onboardPages,
        onCompleted: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
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