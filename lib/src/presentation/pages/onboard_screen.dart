import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/bloc/onboard_bloc.dart';
import '../widgets/onboard_view.dart';


class OnboardScreen extends StatelessWidget {
  final VoidCallback onCompleted;
  final List<Widget> pages;
  final Color btnColor;

  const OnboardScreen({
    super.key,
    required this.onCompleted,
    required this.pages,
   required this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardBloc(pages),
      child: OnboardView(onCompleted: onCompleted, btnColor: btnColor),
    );
  }
}
