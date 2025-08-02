import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/icon.dart';
import '../../../../core/utils/font_styles.dart';

class SettingsItem extends StatelessWidget {
  final String name;
  final String icon;
  final VoidCallback? onTap;
  const SettingsItem({
    super.key,
    required this.name,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Row(
          children: [
            Text(name, style: FontStyles.medium(fontSize: 16)),
            const Spacer(),
            CustomIcon(icon: icon, size: 18),
          ],
        ),
      ),
    );
  }
}
