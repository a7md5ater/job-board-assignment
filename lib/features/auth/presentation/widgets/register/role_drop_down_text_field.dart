import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hunter/core/extensions/user_role.dart';

import '../../../../../core/shared_widgets/vertical_space.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_functions.dart';
import '../../../../../core/utils/font_styles.dart';
import '../../../cubit/auth_cubit.dart';
import '../../../data/models/user_model.dart';

class RoleDropDownTextField extends StatelessWidget {
  const RoleDropDownTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Role',
          style: FontStyles.medium(fontColor: AppColors.text80, fontSize: 13),
        ),
        const VerticalSpace(10),
        DropdownButtonFormField<UserRole>(
          validator:
              (value) => AppFunctions.handleTextFieldValidator(
                validators: [
                  TextFieldValidator(
                    condition: value == null,
                    message: "Please select a role",
                  ),
                ],
              ),
          items: [
            DropdownMenuItem(
              value: UserRole.jobSeeker,
              child: Text(
                'Job Seeker',
                style: FontStyles.regular(fontSize: 14),
              ),
            ),
            DropdownMenuItem(
              value: UserRole.admin,
              child: Text('Admin', style: FontStyles.regular(fontSize: 14)),
            ),
          ],
          dropdownColor: AppColors.backgroundWithe,
          hint: Text(
            'Select Role',
            style: Theme.of(context).inputDecorationTheme.hintStyle,
          ),
          onChanged: (value) {
            context.read<AuthCubit>().registerRoleController.text =
                value!.displayName;
          },
          // decoration: InputDecoration(
          //   hintText: 'Select Role',
          //   border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(8.0),
          //   ),
          // ),
        ),
      ],
    );
  }
}
