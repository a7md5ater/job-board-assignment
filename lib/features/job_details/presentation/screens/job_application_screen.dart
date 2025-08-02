import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hunter/features/job_details/presentation/widgets/submit_application_button.dart';

import '../../../../core/shared_widgets/vertical_space.dart';
import '../../../../core/utils/font_styles.dart';
import '../../../post_job/data/models/job_data.dart';
import '../widgets/apply_for_job_text_fileds.dart';

class JobApplicationScreen extends StatefulWidget {
  final JobData jobData;
  const JobApplicationScreen({super.key, required this.jobData});

  @override
  State<JobApplicationScreen> createState() => _JobApplicationScreenState();
}

class _JobApplicationScreenState extends State<JobApplicationScreen> {
  final GlobalKey<FormState> _submitApplicationJobFormKey =
      GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Text('Apply for Job', style: FontStyles.semiBold(fontSize: 20)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 18.sp,
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpace(20),
              Expanded(
                child: ApplyForJobTextFields(
                  submitApplicationJobFormKey: _submitApplicationJobFormKey,
                ),
              ),
              const VerticalSpace(20),
              SubmitApplicationButton(
                submitApplicationJobFormKey: _submitApplicationJobFormKey,
                jobData: widget.jobData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
