part of 'onboard_bloc.dart';

abstract class OnboardEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NextPageEvent extends OnboardEvent {}

class PreviousPageEvent extends OnboardEvent {}

class SetPageIndexEvent extends OnboardEvent {
  final int pageIndex;

  SetPageIndexEvent({required this.pageIndex});

  @override
  List<Object> get props => [pageIndex];
}