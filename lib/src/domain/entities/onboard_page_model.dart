import 'package:equatable/equatable.dart';

class OnboardPageModel extends Equatable {
  final String title;
  final String description;
  final String animationUrl;

  const OnboardPageModel({
    required this.title,
    required this.description,
    required this.animationUrl,
  });

  @override
  List<Object> get props => [title, description, animationUrl];
}