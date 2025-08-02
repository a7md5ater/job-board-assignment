import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hunter/core/extensions/snackbar.dart';

import '../../../../../../../core/shared_widgets/button.dart';
import '../../../../../config/router/routes.dart';
import '../../../../../core/utils/app_enums.dart';
import '../../../cubit/auth_cubit.dart';

class RegisterButton extends StatelessWidget {
  final GlobalKey<FormState> registerFormKey;
  const RegisterButton({super.key, required this.registerFormKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          registerSuccess: () {
            context.pushReplacementNamed(Routes.login);
            context.showAnimatedSnackbar(
              title: 'SUCCESS',
              message: 'You have successfully registered, please login.',
              type: SnackBarType.success,
            );
          },
          registerError: (message) {
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
            registerLoading: () => true,
            registerSuccess: () => true,
            registerError: (message) => true,
            orElse: () => false,
          ),

      builder: (context, state) {
        return CustomButton(
          text: 'Register',
          loadingCondition: state == const AuthState.registerLoading(),
          onPressed: () {
            if (registerFormKey.currentState!.validate()) {
              context.read<AuthCubit>().register();
            }
          },
        );
      },
    );
  }
}
