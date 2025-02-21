import '../entities/onboard_page_model.dart';

abstract class OnboardRepository {
  Future<List<OnboardPageModel>> getOnboardingPages();
}