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
