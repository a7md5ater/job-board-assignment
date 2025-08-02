import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hunter/core/shared_widgets/app_bar.dart';
import 'package:job_hunter/features/post_job/data/models/job_data.dart';
import 'package:job_hunter/features/post_job/presentation/widgets/post_job_button.dart';

import '../../../../core/shared_widgets/vertical_space.dart';
import '../../../../core/utils/app_enums.dart';
import '../../cubit/post_job_cubit.dart';
import '../widgets/post_job_text_fileds.dart';

class PostJobScreen extends StatefulWidget {
  final JobData? jobData;
  const PostJobScreen({super.key, this.jobData});

  @override
  State<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  final GlobalKey<FormState> _postJobFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (widget.jobData != null) {
      context.read<PostJobCubit>().initializeFields(jobData: widget.jobData!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: widget.jobData != null ? 'Edit Job' : 'Post Job',
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
                child: PostJobTextFields(
                  postJobFormKey: _postJobFormKey,
                  jobStatus: widget.jobData?.status ?? JobStatus.open,
                  isUpdate: widget.jobData != null,
                ),
              ),
              const VerticalSpace(20),
              PostJobButton(
                postJobFormKey: _postJobFormKey,
                jobData: widget.jobData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
