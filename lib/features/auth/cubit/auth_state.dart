part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.changePasswordVisibility(bool isVisible) =
      _ChangePasswordVisibility;
  const factory AuthState.loginLoading() = _LoginLoading;
  const factory AuthState.loginSuccess() = _LoginSuccess;
  const factory AuthState.loginError({required String message}) = _LoginError;
  const factory AuthState.registerLoading() = _RegisterLoading;
  const factory AuthState.registerSuccess() = _RegisterSuccess;
  const factory AuthState.registerError({required String message}) =
      _RegisterError;
}
