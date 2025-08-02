import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class NoItemsFounded extends StatelessWidget {
  final String text;
  final IconData icon;
  const NoItemsFounded({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 100.sp, color: AppColors.text40),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 13.sp,
              color: AppColors.text50,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
