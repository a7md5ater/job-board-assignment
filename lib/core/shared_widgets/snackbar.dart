import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hunter/core/extensions/snackbar.dart';

import '../utils/app_colors.dart';
import '../utils/app_enums.dart';
import '../utils/font_styles.dart';
import 'horizontal_space.dart';
import 'vertical_space.dart';

class AnimatedSnackbar extends StatefulWidget {
  final String title;
  final String message;
  final SnackBarType type;
  final VoidCallback? onClose;
  final void Function()? buttonPressed;
  final String? buttonText;

  const AnimatedSnackbar({
    super.key,
    required this.title,
    required this.message,
    required this.type,
    this.onClose,
    this.buttonPressed,
    this.buttonText,
  });

  @override
  State<AnimatedSnackbar> createState() => _AnimatedSnackbarState();
}

class _AnimatedSnackbarState extends State<AnimatedSnackbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linearToEaseOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linearToEaseOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [widget.type.backgroundColor, Colors.white],
            ),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.text100.withOpacity(0.03),
                blurRadius: 15,
                spreadRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      widget.type.icon,
                      size: 24.sp,
                      color: widget.type.iconColor,
                    ),
                    const HorizontalSpace(12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.title,
                                style: FontStyles.semiBold(
                                  fontSize: 18.sp,
                                  fontColor: AppColors.text100,
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  _controller.reverse().then((value) {
                                    widget.onClose?.call();
                                  });
                                },
                                child: Container(
                                  width: 30.w,
                                  height: 30.h,
                                  color: Colors.transparent,
                                  child: Icon(
                                    Icons.close,
                                    size: 16.sp,
                                    color: AppColors.text100.withOpacity(0.4),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const VerticalSpace(4),
                          Text(
                            widget.message,
                            style: FontStyles.medium(
                              fontSize: 14.sp,
                              fontColor: AppColors.text60,
                            ),
                          ),
                          if (widget.buttonText != null &&
                              widget.buttonPressed != null)
                            Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: TextButton(
                                onPressed: widget.buttonPressed,
                                child: Text(
                                  widget.buttonText!,
                                  style: FontStyles.semiBold(
                                    fontSize: 14,
                                    fontColor: AppColors.primary100,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
