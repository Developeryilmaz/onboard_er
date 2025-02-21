# onboar\_er 🎨🚀

A highly customizable Flutter onboarding package built using `flutter_bloc`. Create elegant, engaging, and smooth onboarding experiences effortlessly! ✨

## 📦 Installation

To install, add the following dependency to your `pubspec.yaml`:

```yaml
dependencies:
  onboar_er: ^0.1.0
```

Then run:

```sh
flutter pub get
```

## 🚀 Features

✅ **Beautiful animations** using Lottie
✅ **StatelessWidget based architecture**
✅ **Bloc state management**
✅ **Customizable UI**
✅ **Notification permission handling**

---

## 🛠 Usage

Easily integrate onboarding screens with just a few lines of code:

```dart
import 'package:flutter/material.dart';
import 'package:onboar_er/onboar_er.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardScreen(
        pages: [
          OnboardModel(
            title: "Welcome!",
            description: "This is an awesome onboarding experience.",
            url: "https://assets10.lottiefiles.com/packages/lf20_jcikwtux.json
            ",
          ),
          OnboardModel(
            title: "Easy to Use",
            description: "Our app is super easy to use!",
            url: "https://cdn.lordicon.com/dxjqoygy.json",
          ),
          OnboardModel(
            title: "Let's Get Started!",
            description: "Begin your journey now!",
            url: "https://assets8.lottiefiles.com/packages/lf20_djdcueig.json
            ",
          ),
        ],
      ),
    );
  }
}
```

---

## 🎨 Customization

You can fully customize your onboarding experience:

```dart
OnboardScreen(
  pages: myOnboardingPages,
  backgroundColor: Colors.white,
  buttonTextStyle: TextStyle(fontSize: 18, color: Colors.blue),
);
```

---

## 🔔 Notification Permission

Easily request notification permission after onboarding:

```dart
Future<void> requestNotificationPermission() async {
  final status = await Permission.notification.request();
  if (status.isGranted) {
    print("Permission Granted");
  } else {
    print("Permission Denied");
  }
}
```

---
