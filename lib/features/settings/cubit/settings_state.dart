part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.logoutLoading() = _LogoutLoading;
  const factory SettingsState.logout() = _Logout;
  const factory SettingsState.logoutError({required String message}) =
      _LogoutError;
}
