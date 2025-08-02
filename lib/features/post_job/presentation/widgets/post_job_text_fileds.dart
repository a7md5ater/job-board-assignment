import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hunter/core/utils/app_enums.dart';
import 'package:job_hunter/features/post_job/presentation/widgets/job_status_drop_down_text_field.dart';

import '../../../../../../../core/shared_widgets/vertical_space.dart';
import '../../../../../../../core/utils/app_functions.dart';
import '../../../../../core/shared_widgets/text_field_with_title.dart';
import '../../cubit/post_job_cubit.dart';

class PostJobTextFields extends StatelessWidget {
  final GlobalKey<FormState> postJobFormKey;
  final JobStatus jobStatus;
  final bool isUpdate;
  const PostJobTextFields({
    super.key,
    required this.postJobFormKey,
    required this.jobStatus,
    required this.isUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: postJobFormKey,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFieldWithTitle(
              title: "Job Title",
              hint: "Enter job title",
              controller: context.read<PostJobCubit>().titleController,
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
              title: "Job Description",
              hint: "Enter job description",
              controller: context.read<PostJobCubit>().descriptionController,
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
              title: "Location",
              hint: "Enter job location",
              controller: context.read<PostJobCubit>().locationController,
              inputType: TextInputType.streetAddress,
              unfocusedWhenTapOutside: false,
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
            Padding(
              padding: EdgeInsets.only(
                bottom:
                    isUpdate ? 0.0 : MediaQuery.of(context).viewInsets.bottom,
              ),
              child: CustomTextFieldWithTitle(
                title: "Salary",
                hint: "Enter job salary",
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                controller: context.read<PostJobCubit>().salaryController,
                inputType: TextInputType.number,
                unfocusedWhenTapOutside: false,
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
            ),
            if (isUpdate) const VerticalSpace(16),
            if (isUpdate)
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: JobStatusDropDownTextField(jobStatus: jobStatus),
              ),
          ],
        ),
      ),
    );
  }
}
