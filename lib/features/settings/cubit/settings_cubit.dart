import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:job_hunter/core/user_cubit.dart';

import '../domain/usecases/logout_usecase.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final LogoutUseCase _logoutUseCase;
  final UserCubit _userCubit;
  SettingsCubit({
    required LogoutUseCase logoutUseCase,
    required UserCubit userCubit,
  }) : _logoutUseCase = logoutUseCase,
       _userCubit = userCubit,
       super(SettingsState.initial());

  Future<void> logout() async {
    emit(SettingsState.logoutLoading());
    final result = await _logoutUseCase();
    result.fold(
      (failure) => emit(SettingsState.logoutError(message: failure.message)),
      (_) {
        _userCubit.clearUser();
        emit(SettingsState.logout());
      },
    );
  }
}
