import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../onboard_er.dart';

class OnboardView extends StatelessWidget {
  final VoidCallback onCompleted;
  final Color btnColor;

  const OnboardView({super.key, required this.onCompleted, required this.btnColor});

  @override
  Widget build(BuildContext context) {
    final onboardBloc = context.read<OnboardBloc>(); // ✅ Access BLoC

    return Scaffold(
      body: BlocConsumer<OnboardBloc, OnboardState>(
        listener: (context, state) {
          onboardBloc.pageController.animateToPage( // ✅ Ensure PageView listens to state
            state.pageIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: onboardBloc.pageController, // ✅ Connect PageController
                  onPageChanged: (index) =>
                      context.read<OnboardBloc>().add(SetPageIndexEvent(pageIndex: index)),
                  itemCount: state.pages.length,
                  itemBuilder: (context, index) => OnboardPage(child: state.pages[index]),
                ),
              ),
              BottomNavigation(state: state, onCompleted: onCompleted, btnColor: btnColor,),
            ],
          );
        },
      ),
    );
  }
}