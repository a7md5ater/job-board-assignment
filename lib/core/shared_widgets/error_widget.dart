import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hunter/core/shared_widgets/vertical_space.dart';

import '../utils/app_colors.dart';
import '../utils/font_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  const CustomErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, size: 120.sp, color: AppColors.primary20),
          const VerticalSpace(10),
          Text(
            message,
            style: FontStyles.regular(
              fontSize: 14,
              fontColor: AppColors.text50,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
