import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/font_styles.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.w),
        child: Text(
          "Forget Password?",
          style: FontStyles.regular(
            fontSize: 12,
            fontColor: AppColors.primary80,
          ),
        ),
      ),
    );
  }
}
