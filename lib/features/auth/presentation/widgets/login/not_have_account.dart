import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/font_styles.dart';
import '../../../../../config/router/routes.dart';

class NotHaveAccount extends StatelessWidget {
  const NotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${"Don't have an account"} ',
          style: FontStyles.regular(fontSize: 13),
        ),
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.register);
          },
          child: Text(
            'Register',
            style: FontStyles.medium(
              fontSize: 13,
              fontColor: AppColors.primary100,
            ),
          ),
        ),
      ],
    );
  }
}
