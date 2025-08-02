// import 'package:attendance/core/helpers/extensions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hunter/core/extensions/snackbar.dart';

import '../../../../../../../core/shared_widgets/button.dart';
import '../../../../../config/router/routes.dart';
import '../../../../../core/utils/app_enums.dart';
import '../../../cubit/auth_cubit.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> loginFormKey;
  const LoginButton({super.key, required this.loginFormKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          loginSuccess: () {
            // Navigate to home screen
            context.pushReplacementNamed(Routes.home);
          },
          loginError: (message) {
            // Show error message
            context.showAnimatedSnackbar(
              title: 'ERROR',
              message: message,
              type: SnackBarType.error,
            );
          },
          orElse: () {},
        );
      },
      buildWhen:
          (previous, current) => current.maybeWhen(
            loginLoading: () => true,
            loginSuccess: () => true,
            loginError: (message) => true,
            orElse: () => false,
          ),
      builder: (context, state) {
        return CustomButton(
          text: "Login",
          loadingCondition: state == const AuthState.loginLoading(),
          onPressed: () {
            if (loginFormKey.currentState!.validate()) {
              context.read<AuthCubit>().login();
            }
          },
        );
      },
    );
  }
}
