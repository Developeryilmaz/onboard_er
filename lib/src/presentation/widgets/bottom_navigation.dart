import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboard_er/src/presentation/widgets/page_indicator.dart';
import '../../application/bloc/onboard_bloc.dart';

class BottomNavigation extends StatelessWidget {
  final OnboardState state;
  final VoidCallback onCompleted;

  const BottomNavigation({
    super.key,
    required this.state,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          PageIndicator(state: state),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: state.pageIndex > 0,
                child: FloatingActionButton(
                  onPressed: () => context.read<OnboardBloc>().add(PreviousPageEvent()),
                  child: const Icon(Icons.arrow_back),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  if (state.pageIndex < state.pages.length - 1) {
                    context.read<OnboardBloc>().add(NextPageEvent());
                  } else {
                    onCompleted();
                  }
                },
                child: Icon(
                  state.pageIndex == state.pages.length - 1 ? Icons.check : Icons.arrow_forward,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}