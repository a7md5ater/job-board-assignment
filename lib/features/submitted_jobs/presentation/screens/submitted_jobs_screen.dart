import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hunter/features/submitted_jobs/presentation/widgets/submitted_jobs_sliver.dart';

import '../../../../app/injector.dart';
import '../../../../core/shared_widgets/vertical_space.dart';
import '../../../../core/utils/font_styles.dart';
import '../../../activity/presentation/widgets/info_head.dart';
import '../../cubit/submitted_jobs_cubit.dart';

class SubmittedJobsScreen extends StatelessWidget {
  const SubmittedJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<SubmittedJobsCubit>()..getSubmittedJobs(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpace(10),
                  const InfoHead(),
                  const VerticalSpace(30),
                  Text(
                    "Submitted Jobs",
                    style: FontStyles.semiBold(fontSize: 28),
                  ),
                  const VerticalSpace(20),
                ],
              ),
            ),
            const SubmittedJobsSliver(),
          ],
        ),
      ),
    );
  }
}
