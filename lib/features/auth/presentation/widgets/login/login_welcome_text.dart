import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/font_styles.dart';

class LoginWelcomeText extends StatelessWidget {
  const LoginWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "${"Welcome Back🙌"} \n${"at"}",
            style: FontStyles.semiBold(
              fontSize: 30,
              letterSpacing: 0.5,
              height: 1.4,
            ),
          ),
          TextSpan(
            text: " Job Hunter",
            style: FontStyles.semiBold(
              fontSize: 30,
              fontColor: AppColors.primary100,
              letterSpacing: 0.8,
              height: 1.4,
            ),
          ),
          TextSpan(
            text: " Login to continue",
            style: FontStyles.regular(
              fontSize: 14.5,
              fontColor: AppColors.text50,
              letterSpacing: 0.5,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
