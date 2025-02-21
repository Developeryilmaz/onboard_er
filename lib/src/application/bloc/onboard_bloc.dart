import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/onboard_page_model.dart';


part 'onboard_event.dart';
part 'onboard_state.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  OnboardBloc(List<OnboardPageModel> pages)
      : super(OnboardState(pageIndex: 0, pages: pages));

  @override
  Stream<OnboardState> mapEventToState(OnboardEvent event) async* {
    if (event is NextPageEvent) {
      if (state.pageIndex < state.pages.length - 1) {
        yield state.copyWith(pageIndex: state.pageIndex + 1);
      }
    } else if (event is PreviousPageEvent) {
      if (state.pageIndex > 0) {
        yield state.copyWith(pageIndex: state.pageIndex - 1);
      }
    } else if (event is SetPageIndexEvent) {
      yield state.copyWith(pageIndex: event.pageIndex);
    }
  }
}