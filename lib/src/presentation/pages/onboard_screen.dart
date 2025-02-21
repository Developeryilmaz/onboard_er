import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/bloc/onboard_bloc.dart';
import '../widgets/onboard_view.dart';
import '../../domain/entities/onboard_page_model.dart';

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