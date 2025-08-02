import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:job_hunter/core/extensions/strings.dart';
import 'package:job_hunter/core/user_cubit.dart';

import '../data/models/login_body.dart';
import '../data/models/register_body.dart';
import '../domain/usecases/login_use_case.dart';
import '../domain/usecases/register_use_case.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final UserCubit _userCubit;
  AuthCubit({
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
    required UserCubit userCubit,
  }) : _loginUseCase = loginUseCase,
       _registerUseCase = registerUseCase,
       _userCubit = userCubit,
       super(const AuthState.initial());

  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  final TextEditingController registerFirstNameController =
      TextEditingController();
  final TextEditingController registerLastNameController =
      TextEditingController();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController =
      TextEditingController();
  final TextEditingController registerPasswordConfirmationController =
      TextEditingController();
  final TextEditingController registerRoleController = TextEditingController();

  void changePasswordVisibility({required bool isVisible}) {
    emit(AuthState.changePasswordVisibility(!isVisible));
  }

  void login() async {
    emit(const AuthState.loginLoading());

    final response = await _loginUseCase.call(
      loginBody: LoginBody(
        email: loginEmailController.text,
        password: loginPasswordController.text,
      ),
    );
    response.fold(
      (failure) => emit(AuthState.loginError(message: failure.message)),
      (user) {
        loginEmailController.clear();
        loginPasswordController.clear();
        _userCubit.updateUser(user);
        emit(const AuthState.loginSuccess());
      },
    );
  }

  void register() async {
    emit(const AuthState.registerLoading());
    print("================>${registerFirstNameController.text}");
    final response = await _registerUseCase.call(
      registerBody: RegisterBody(
        firstName: registerFirstNameController.text,
        lastName: registerLastNameController.text,
        email: registerEmailController.text,
        password: registerPasswordController.text,
        role: registerRoleController.text.userRole,
      ),
    );
    response.fold(
      (failure) => emit(AuthState.registerError(message: failure.message)),
      (apiResponse) {
        registerFirstNameController.clear();
        registerLastNameController.clear();
        registerEmailController.clear();
        registerPasswordController.clear();
        registerPasswordConfirmationController.clear();
        registerRoleController.clear();
        emit(const AuthState.registerSuccess());
      },
    );
  }

  @override
  Future<void> close() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    registerFirstNameController.dispose();
    registerLastNameController.dispose();
    registerEmailController.dispose();
    registerPasswordController.dispose();
    registerPasswordConfirmationController.dispose();
    registerRoleController.dispose();
    return super.close();
  }
}
