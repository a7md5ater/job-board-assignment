import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/shared_widgets/vertical_space.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_functions.dart';
import '../../../../../core/shared_widgets/text_field_with_title.dart';
import '../../../cubit/auth_cubit.dart';

class LoginTextFields extends StatelessWidget {
  final GlobalKey<FormState> loginFormKey;
  const LoginTextFields({super.key, required this.loginFormKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Column(
        children: [
          CustomTextFieldWithTitle(
            title: "Email",
            hint: "Enter your email",
            controller: context.read<AuthCubit>().loginEmailController,
            inputType: TextInputType.visiblePassword,
            validator:
                (value) => AppFunctions.handleTextFieldValidator(
                  validators: [
                    TextFieldValidator(
                      condition: value!.trim().isEmpty,
                      message: "can't be empty",
                    ),
                    TextFieldValidator(
                      condition: !EmailValidator.validate(value),
                      message: "invalid email, please enter a valid email",
                    ),
                  ],
                ),
          ),
          const VerticalSpace(16),
          BlocBuilder<AuthCubit, AuthState>(
            buildWhen:
                (previous, current) => current.maybeWhen(
                  changePasswordVisibility: (isVisible) => true,
                  orElse: () => false,
                ),
            builder: (context, state) {
              bool isVisible =
                  (state == const AuthState.changePasswordVisibility(true));
              return CustomTextFieldWithTitle(
                title: "Password",
                hint: "Enter your password",
                controller: context.read<AuthCubit>().loginPasswordController,
                inputType: TextInputType.visiblePassword,
                obscureText: !isVisible,
                validator:
                    (value) => AppFunctions.handleTextFieldValidator(
                      validators: [
                        TextFieldValidator(
                          condition: value!.trim().isEmpty,
                          message: "can't be empty",
                        ),
                      ],
                    ),
                suffixIcon: IconButton(
                  onPressed:
                      () => context.read<AuthCubit>().changePasswordVisibility(
                        isVisible: isVisible,
                      ),
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                    color: isVisible ? AppColors.primary40 : AppColors.text50,
                    size: 20.sp,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
