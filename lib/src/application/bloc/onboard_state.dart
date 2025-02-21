part of 'onboard_bloc.dart';

class OnboardState extends Equatable {
  final int pageIndex;
  final List<OnboardPageModel> pages;

  const OnboardState({required this.pageIndex, required this.pages});

  @override
  List<Object> get props => [pageIndex, pages];

  OnboardState copyWith({int? pageIndex}) {
    return OnboardState(
      pageIndex: pageIndex ?? this.pageIndex,
      pages: pages,
    );
  }
}
