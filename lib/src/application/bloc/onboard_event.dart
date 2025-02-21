part of 'onboard_bloc.dart';

abstract class OnboardEvent {}

class NextPageEvent extends OnboardEvent {}

class PreviousPageEvent extends OnboardEvent {}

class SetPageIndexEvent extends OnboardEvent {
  final int pageIndex;
  SetPageIndexEvent({required this.pageIndex});
}