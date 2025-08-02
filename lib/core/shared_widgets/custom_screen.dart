import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/font_styles.dart';
import 'back_button.dart';

class CustomScreen extends StatelessWidget {
  final Widget child;
  final bool showBackButton;
  final String? title;
  const CustomScreen({
    super.key,
    required this.child,
    this.showBackButton = true,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            showBackButton
                ? Padding(
                  padding: EdgeInsetsDirectional.only(start: 4.w),
                  child: const CustomBackButton(),
                )
                : null,
        leadingWidth: showBackButton ? 50.w : 0,
        toolbarHeight: showBackButton ? 50.h : 0,
        title:
            title != null
                ? Text(
                  title!,
                  style: FontStyles.semiBold(
                    fontColor: AppColors.text100,
                    fontSize: 20,
                  ),
                )
                : null,
        elevation: 0,
      ),
      body: SafeArea(child: child),
    );
  }
}
