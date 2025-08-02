import 'package:dartz/dartz.dart';
import 'package:job_hunter/core/failures/failures.dart';

import '../repositories/settings_repository.dart';

class LogoutUseCase {
  final SettingsRepository _settingsRepository;

  LogoutUseCase({required SettingsRepository settingsRepository})
    : _settingsRepository = settingsRepository;

  Future<Either<Failure, void>> call() async {
    return _settingsRepository.logout();
  }
}
