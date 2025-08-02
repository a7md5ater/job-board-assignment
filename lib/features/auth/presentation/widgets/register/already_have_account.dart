import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/font_styles.dart';
import '../../../../../config/router/routes.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${"Already have an account"} ',
          style: FontStyles.regular(fontSize: 13),
        ),
        GestureDetector(
          onTap: () {
            context.pushReplacementNamed(Routes.login);
          },
          child: Text(
            'Login',
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
