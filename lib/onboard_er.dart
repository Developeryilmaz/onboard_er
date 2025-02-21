import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

// Bloc Events
abstract class OnboardEvent {}

class NextPageEvent extends OnboardEvent {}

class PreviousPageEvent extends OnboardEvent {}

class SetPageIndexEvent extends OnboardEvent {
  final int pageIndex;
  SetPageIndexEvent({required this.pageIndex});
}

// Bloc State
class OnboardState {
  final int pageIndex;
  final List<OnboardPageModel> pages;

  OnboardState({required this.pageIndex, required this.pages});

  // copyWith for better state updates
  OnboardState copyWith({int? pageIndex}) {
    return OnboardState(
      pageIndex: pageIndex ?? this.pageIndex,
      pages: pages,
    );
  }
}

// Bloc Implementation
class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  OnboardBloc(List<OnboardPageModel> pages)
      : super(OnboardState(pageIndex: 0, pages: pages)) {
    on<NextPageEvent>((event, emit) {
      if (state.pageIndex < state.pages.length - 1) {
        emit(state.copyWith(pageIndex: state.pageIndex + 1));
      }
    });

    on<PreviousPageEvent>((event, emit) {
      if (state.pageIndex > 0) {
        emit(state.copyWith(pageIndex: state.pageIndex - 1));
      }
    });

    on<SetPageIndexEvent>((event, emit) {
      emit(state.copyWith(pageIndex: event.pageIndex));
    });
  }
}

// Page Model
class OnboardPageModel {
  final String title;
  final String description;
  final String animationNetwork;

  OnboardPageModel({
    required this.title,
    required this.description,
    required this.animationNetwork,
  });
}

// Onboarding Screen
class OnboardScreen extends StatelessWidget {
  final VoidCallback onCompleted;
  final List<OnboardPageModel> pages;

  const OnboardScreen({
    super.key,
    required this.onCompleted,
    required this.pages,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardBloc(pages),
      child: OnboardView(onCompleted: onCompleted),
    );
  }
}

// Onboarding View
class OnboardView extends StatelessWidget {
  final VoidCallback onCompleted;
  const OnboardView({super.key, required this.onCompleted});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return Scaffold(
      body: BlocConsumer<OnboardBloc, OnboardState>(
        listener: (context, state) {
          pageController.animateToPage(
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
                  controller: pageController,
                  onPageChanged: (index) =>
                      context.read<OnboardBloc>().add(SetPageIndexEvent(pageIndex: index)),
                  itemCount: state.pages.length,
                  itemBuilder: (context, index) => OnboardPage(page: state.pages[index]),
                ),
              ),
              _BottomNavigation(
                state: state,
                onCompleted: onCompleted,
              ),
            ],
          );
        },
      ),
    );
  }
}

// Bottom Navigation
class _BottomNavigation extends StatelessWidget {
  final OnboardState state;
  final VoidCallback onCompleted;

  const _BottomNavigation({
    required this.state,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          _PageIndicators(state: state),
          const SizedBox(height: 20),

          // Navigation Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Back Button
              Visibility(
                visible: state.pageIndex > 0,
                child: FloatingActionButton(
                  onPressed: () => context.read<OnboardBloc>().add(PreviousPageEvent()),
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.arrow_back, color: Colors.black),
                ),
              ),

              // Next / Finish Button
              FloatingActionButton(
                onPressed: () {
                  if (state.pageIndex < state.pages.length - 1) {
                    context.read<OnboardBloc>().add(NextPageEvent());
                  } else {
                    onCompleted();
                  }
                },
                backgroundColor: Colors.black,
                child: Icon(
                  state.pageIndex == state.pages.length - 1 ? Icons.check : Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Page Indicators
class _PageIndicators extends StatelessWidget {
  final OnboardState state;

  const _PageIndicators({required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        state.pages.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: state.pageIndex == index ? 12 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: state.pageIndex == index ? Colors.black : Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}

// Onboarding Page
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
            page.animationNetwork,
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
              color: Colors.black,
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



