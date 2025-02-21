import 'package:flutter/material.dart';
import '../../application/bloc/onboard_bloc.dart';

class PageIndicator extends StatelessWidget {
  final OnboardState state;

  const PageIndicator({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        state.pages.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: state.pageIndex == index ? 16 : 8,
          height: 8,
          decoration: BoxDecoration(
            color:
                state.pageIndex == index ? Colors.deepPurpleAccent : Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
