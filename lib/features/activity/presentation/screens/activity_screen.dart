import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hunter/core/extensions/user_context.dart';
import 'package:job_hunter/features/auth/data/models/user_model.dart';

import '../../../../../../core/utils/font_styles.dart';
import '../../../../app/injector.dart';
import '../../../../core/shared_widgets/vertical_space.dart';
import '../../../auth/data/datasources/auth_local_data_source.dart';
import '../../cubit/activity_cubit.dart';
import '../widgets/info_head.dart';
import '../../../home/presentation/widgets/home_jobs/home_jobs_sliver.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<ActivityCubit>(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
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
                    context.user?.role == UserRole.admin
                        ? "Posted Jobs"
                        : "Available Jobs",
                    style: FontStyles.semiBold(fontSize: 28),
                  ),
                  const VerticalSpace(20),
                ],
              ),
            ),
            HomeJobsSliver(),
          ],
        ),
      ),
    );
  }
}
