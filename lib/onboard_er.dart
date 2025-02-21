library onboard_er;

// Export Application Layer (Bloc)
export 'src/application/bloc/onboard_bloc.dart';

// Export Domain Layer (Entities & Use Cases)
export 'src/domain/entities/onboard_page_model.dart';
export 'src/domain/usecases/get_onboard_pages.dart';
export 'src/domain/repositories/onboard_repository.dart';

// Export Presentation Layer (UI Components)
export 'src/presentation/pages/onboard_screen.dart';
export 'src/presentation/widgets/onboard_page.dart';
export 'src/presentation/widgets/bottom_navigation.dart';
export 'src/presentation/widgets/page_indicator.dart';
export 'src/presentation/widgets/onboard_view.dart';