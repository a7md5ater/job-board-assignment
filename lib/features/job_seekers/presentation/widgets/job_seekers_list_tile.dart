import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/font_styles.dart';

class JobSeekerListTile extends StatelessWidget {
  final String name;
  final String email;
  final String firstChar;
  final bool isLoading;
  final VoidCallback? onTap;

  const JobSeekerListTile({
    super.key,
    required this.name,
    required this.email,
    required this.firstChar,
    this.isLoading = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(name, style: FontStyles.medium(fontSize: 15)),
      subtitle: Text(
        email,
        style: FontStyles.regular(fontSize: 13, fontColor: AppColors.text60),
      ),
      leading: CircleAvatar(
        radius: 24.r,
        backgroundColor: isLoading ? AppColors.primary20 : AppColors.primary100,
        child: Text(
          firstChar,
          style: FontStyles.semiBold(
            fontSize: 18,
            fontColor: AppColors.backgroundWithe,
          ),
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16.sp,
        color: AppColors.text50,
      ),
      onTap: onTap,
    );
  }
}
