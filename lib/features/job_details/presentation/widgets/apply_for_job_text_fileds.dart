import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hunter/features/job_details/cubit/job_details_cubit.dart';

import '../../../../../../../core/shared_widgets/vertical_space.dart';
import '../../../../../../../core/utils/app_functions.dart';
import '../../../../../core/shared_widgets/text_field_with_title.dart';

class ApplyForJobTextFields extends StatelessWidget {
  final GlobalKey<FormState> submitApplicationJobFormKey;
  const ApplyForJobTextFields({
    super.key,
    required this.submitApplicationJobFormKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: submitApplicationJobFormKey,
      child: Column(
        children: [
          CustomTextFieldWithTitle(
            title: "Resume",
            hint: "Enter your resume",
            controller: context.read<JobDetailsCubit>().resumeController,
            inputType: TextInputType.multiline,
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
            title: "Cover Letter",
            hint: "Enter your cover letter",
            controller: context.read<JobDetailsCubit>().coverLetterController,
            inputType: TextInputType.multiline,
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
        ],
      ),
    );
  }
}
