# onboard_er 🎨🍺

A highly customizable Flutter onboarding package built using `flutter_bloc`. Create elegant, engaging, and smooth onboarding experiences effortlessly! ✨

## 📦 Installation

To install, add the following dependency to your `pubspec.yaml`:

```yaml
dependencies:
  onboard_er: ^0.1.0
```

Then run:

```sh
flutter pub get
```

## 🍺 Features

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
import 'package:onboard_er/onboard_er.dart';

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
            imageAsset: "assets/animation1.json",
          ),
          OnboardModel(
            title: "Easy to Use",
            description: "Our app is super easy to use!",
            imageAsset: "assets/animation2.json",
          ),
          OnboardModel(
            title: "Let's Get Started!",
            description: "Begin your journey now!",
            imageAsset: "assets/animation3.json",
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

## 📌 Roadmap

- [ ] Multi-language support 🌍
- [ ] Dark mode support 🌙
- [ ] More built-in themes 🎨
- [ ] Additional onboarding transition effects ✨

---

## 📄 License

```text
Pharrax Software - YILMAZ ER

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

...
```

---

## 🌟 Contributing

Contributions are welcome! Feel free to open issues or submit pull requests on [GitHub](https://github.com/Developeryilmaz/onboard_er). 💙

---

## 📬 Contact

For any inquiries or feedback, reach out via [GitHub Issues](https://github.com/Developeryilmaz/onboard_er/issues) or email me at `yilmazer@pharraxsoftware.com`. 🍺

