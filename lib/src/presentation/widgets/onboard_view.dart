import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboard_er/src/presentation/widgets/bottom_navigation.dart';
import 'package:onboard_er/src/presentation/widgets/onboard_page.dart';
import '../../application/bloc/onboard_bloc.dart';


class OnboardView extends StatelessWidget {
  final VoidCallback onCompleted;

  const OnboardView({super.key, required this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardBloc, OnboardState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (index) =>
                      context.read<OnboardBloc>().add(SetPageIndexEvent(pageIndex: index)),
                  itemCount: state.pages.length,
                  itemBuilder: (context, index) => OnboardPage(page: state.pages[index]),
                ),
              ),
              BottomNavigation(state: state, onCompleted: onCompleted),
            ],
          );
        },
      ),
    );
  }
}