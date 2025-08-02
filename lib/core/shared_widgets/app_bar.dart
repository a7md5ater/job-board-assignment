import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../utils/font_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? trailing;
  const CustomAppBar({super.key, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(title, style: FontStyles.semiBold(fontSize: 20)),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        iconSize: 18.sp,
        onPressed: () => context.pop(),
      ),
      actions: trailing != null ? [trailing!] : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(64.h);
}
