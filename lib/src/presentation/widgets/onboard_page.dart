import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../domain/entities/onboard_page_model.dart';

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