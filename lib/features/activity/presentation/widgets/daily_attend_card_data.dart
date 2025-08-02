import 'package:flutter/material.dart';

import '../../../../../../core/shared_widgets/vertical_space.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/font_styles.dart';

class DailyAttendanceCardHead extends StatelessWidget {
  final String title;
  final String description;
  final CrossAxisAlignment crossAxisAlignment;
  final Color descriptionColor;
  const DailyAttendanceCardHead({
    super.key,
    required this.title,
    required this.description,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.descriptionColor = AppColors.text80,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(title, style: FontStyles.semiBold(fontSize: 20)),
        const VerticalSpace(10),
        Text(
          description,
          style: FontStyles.regular(
            fontSize: 12.5,
            fontColor: descriptionColor,
            height: 1.7,
            // letterSpacing: 0.7,
          ),

          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class DailyAttendanceCardBottom extends StatelessWidget {
  final String title;
  final String description;
  final Color descriptionColor;
  const DailyAttendanceCardBottom({
    super.key,
    required this.title,
    required this.description,
    this.descriptionColor = AppColors.text80,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: FontStyles.medium(fontSize: 14)),
          const VerticalSpace(6),
          Text(
            description,
            style: FontStyles.regular(
              fontSize: 11.8,
              fontColor: descriptionColor,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
