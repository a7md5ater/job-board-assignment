import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared_widgets/snackbar.dart';
import '../utils/app_enums.dart';

extension SnackBarTypeExtension on SnackBarType {
  IconData get icon {
    switch (this) {
      case SnackBarType.error:
        return Icons.error_outline;
      case SnackBarType.warning:
        return Icons.warning_rounded;
      case SnackBarType.success:
        return Icons.check_rounded;
      case SnackBarType.info:
        return Icons.info_rounded;
    }
  }

  Color get backgroundColor {
    switch (this) {
      case SnackBarType.error:
        return const Color(0xFFFFEFEF);
      case SnackBarType.warning:
        return const Color(0xFFFFF9E5);
      case SnackBarType.success:
        return const Color(0xFFD8E3F7);
      case SnackBarType.info:
        return const Color(0xFFD8E3F7);
    }
  }

  Color get iconColor {
    switch (this) {
      case SnackBarType.error:
        return const Color(0xFFFF4D4D);
      case SnackBarType.warning:
        return const Color(0xFFFFB800);
      case SnackBarType.success:
        return const Color(0xFF00B341);
      case SnackBarType.info:
        return const Color(0xFF0085FF);
    }
  }
}

extension SnackBarExtension on BuildContext {
  void showAnimatedSnackbar({
    required String title,
    required String message,
    required SnackBarType type,
    Duration duration = const Duration(seconds: 5),
    String? buttonText,
    void Function()? onButtonPressed,
  }) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            bottom:
                MediaQuery.of(context).padding.bottom +
                20.h, // Adjust position as needed
            left: 12.w,
            right: 12.w,
            child: Material(
              color: Colors.transparent,
              child: AnimatedSnackbar(
                title: title,
                message: message,
                type: type,
                onClose: () {
                  // if (overlayEntry != null) {
                  //   overlayEntry.remove();
                  // }
                },
                buttonText: buttonText,
                buttonPressed: onButtonPressed,
              ),
            ),
          ),
    );

    // Insert the overlay into the Overlay
    Overlay.of(this).insert(overlayEntry);

    // Remove the overlay after the duration
    Future.delayed(duration, () {
      if (overlayEntry != null) {
        overlayEntry.remove();
      }
    });
  }
}
