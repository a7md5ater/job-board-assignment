import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hunter/features/auth/presentation/widgets/register/role_drop_down_text_field.dart';

import '../../../../../../../core/shared_widgets/vertical_space.dart';
import '../../../../../../../core/utils/app_functions.dart';
import '../../../../../core/shared_widgets/text_field_with_title.dart';
import '../../../cubit/auth_cubit.dart';

class RegisterTextFields extends StatelessWidget {
  final GlobalKey<FormState> registerFormKey;
  const RegisterTextFields({super.key, required this.registerFormKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: [
          CustomTextFieldWithTitle(
            title: "First Name",
            hint: "Enter your first name",
            controller: context.read<AuthCubit>().registerFirstNameController,
            inputType: TextInputType.text,
            validator:
                (value) => AppFunctions.handleTextFieldValidator(
                  validators: [
                    TextFieldValidator(
                      condition: value!.trim().isEmpty,
                      message: "can't be empty",
                    ),
                  ],
                ),
          ),
          const VerticalSpace(16),
          CustomTextFieldWithTitle(
            title: "Last Name",
            hint: "Enter your last name",
            controller: context.read<AuthCubit>().registerLastNameController,
            inputType: TextInputType.text,
            validator:
                (value) => AppFunctions.handleTextFieldValidator(
                  validators: [
                    TextFieldValidator(
                      condition: value!.trim().isEmpty,
                      message: "can't be empty",
                    ),
                  ],
                ),
          ),
          const VerticalSpace(16),
          CustomTextFieldWithTitle(
            title: "Email Address",
            hint: "Enter your email address",
            controller: context.read<AuthCubit>().registerEmailController,
            inputType: TextInputType.emailAddress,
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
          // const VerticalSpace(16),
          // const SignupPhoneTextField(),
          const VerticalSpace(16),
          CustomTextFieldWithTitle(
            title: "Password",
            hint: "Enter your password",
            controller: context.read<AuthCubit>().registerPasswordController,
            inputType: TextInputType.visiblePassword,
            validator:
                (value) => AppFunctions.handleTextFieldValidator(
                  validators: [
                    TextFieldValidator(
                      condition: value!.trim().isEmpty,
                      message: "can't be empty",
                    ),
                  ],
                ),
          ),
          const VerticalSpace(16),
          CustomTextFieldWithTitle(
            title: "Password Confirmation",
            hint: "Enter your password",
            controller:
                context
                    .read<AuthCubit>()
                    .registerPasswordConfirmationController,
            inputType: TextInputType.visiblePassword,
            validator:
                (value) => AppFunctions.handleTextFieldValidator(
                  validators: [
                    TextFieldValidator(
                      condition: value!.trim().isEmpty,
                      message: "can't be empty",
                    ),
                    TextFieldValidator(
                      condition:
                          value.trim() !=
                          context
                              .read<AuthCubit>()
                              .registerPasswordController
                              .text
                              .trim(),
                      message: "passwords do not match",
                    ),
                  ],
                ),
          ),

          const VerticalSpace(16),
          const RoleDropDownTextField(),
        ],
      ),
    );
  }
}
