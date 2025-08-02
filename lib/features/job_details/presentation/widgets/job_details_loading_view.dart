import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/shared_widgets/vertical_space.dart';
import '../../../../core/utils/app_colors.dart';

class JobDetailsLoadingView extends StatelessWidget {
  const JobDetailsLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Loading....................."),
                  VerticalSpace(2),
                  Text("Loading.............."),
                  VerticalSpace(2),
                  Text("Loading........."),
                ],
              ),
              const Spacer(),
              Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: AppColors.primary20,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          VerticalSpace(40),
          Text("Loading...................."),
          Text("Loading\n\n\n\n...................."),
          VerticalSpace(60),
          Text("Loading...................."),
          Text("Loading\n\n\n\n.........................."),
        ],
      ),
    );
  }
}
