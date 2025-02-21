import '../entities/onboard_page_model.dart';
import '../repositories/onboard_repository.dart';

class GetOnboardPages {
  final OnboardRepository repository;

  GetOnboardPages({required this.repository});

  Future<List<OnboardPageModel>> call() {
    return repository.getOnboardingPages();
  }
}