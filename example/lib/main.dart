import 'package:flutter/material.dart';
import 'package:log_er/log_er.dart';
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
      theme: ThemeData(primarySwatch: Colors.blue),
      home: OnboardScreen(
        onCompleted: () async {
          await requestNotificationPermission();
          Log.debug('Onboarding Completed');
        },
        pages: pages,
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
    animationNetwork:
        "https://assets10.lottiefiles.com/packages/lf20_jcikwtux.json",
  ),
  OnboardPageModel(
    title: "Fast & Efficient",
    description: "Quickly set up and get started with our amazing app.",
    animationNetwork:
        "https://assets2.lottiefiles.com/packages/lf20_kkflmtur.json",
  ),
  OnboardPageModel(
    title: "Enable Notifications",
    description: "Stay updated with important notifications.",
    animationNetwork:
        "https://assets1.lottiefiles.com/packages/lf20_3rwasyjy.json",
  ),
];
