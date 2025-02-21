


import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'onboard_event.dart';
part 'onboard_state.dart';


class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  final PageController pageController = PageController(); // ✅ Page Controller inside BLoC

  OnboardBloc(List<Widget> pages)
      : super(OnboardState(pageIndex: 0, pages: pages)) {
    
    on<NextPageEvent>((event, emit) {
      if (state.pageIndex < state.pages.length - 1) {
        pageController.nextPage( // ✅ Moves page
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        emit(state.copyWith(pageIndex: state.pageIndex + 1));
      }
    });

    on<PreviousPageEvent>((event, emit) {
      if (state.pageIndex > 0) {
        pageController.previousPage( // ✅ Moves page back
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        emit(state.copyWith(pageIndex: state.pageIndex - 1));
      }
    });

    on<SetPageIndexEvent>((event, emit) {
      pageController.jumpToPage(event.pageIndex); // ✅ Directly jumps to page
      emit(state.copyWith(pageIndex: event.pageIndex));
    });
  }
}