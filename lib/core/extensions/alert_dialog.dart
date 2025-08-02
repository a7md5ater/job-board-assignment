import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../shared_widgets/circle_indicator.dart';
import '../utils/app_colors.dart';
import '../utils/font_styles.dart';

extension AlertDialogExt on BuildContext {
  Future<T?> alertDialog<T>({
    required String title,
    required String text,
    required void Function() okPressed,
    required void Function() cancelPressed,
  }) {
    return showDialog(
      context: this,
      barrierDismissible: true,
      builder: (BuildContext context) {
        bool loading = false;
        return StatefulBuilder(
          builder:
              (_, setState) => PopScope(
                canPop: false,
                child: AlertDialog(
                  backgroundColor: AppColors.backgroundWithe,
                  surfaceTintColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: FontStyles.semiBold(
                          fontColor: AppColors.text100,
                          fontSize: 23,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  content: Text(
                    text,
                    style: FontStyles.regular(
                      fontColor: AppColors.text100,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                  contentPadding: EdgeInsets.only(
                    top: 20.h,
                    bottom: 5.h,
                    right: 28.w,
                    left: 28.w,
                  ),
                  actionsPadding: EdgeInsets.only(bottom: 8.h, top: 5.h),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: loading ? null : cancelPressed,
                            child: Text(
                              "Cancel",
                              style: FontStyles.semiBold(
                                fontColor: AppColors.text100,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child:
                              loading
                                  ? Center(
                                    child: CustomCircleIndicator(
                                      size: 15.sp,
                                      strokeWidth: 1.2,
                                    ),
                                  )
                                  : TextButton(
                                    onPressed: () {
                                      setState(() {
                                        loading = !loading;
                                      });
                                      okPressed();
                                    },
                                    child: Text(
                                      "Ok",
                                      style: FontStyles.semiBold(
                                        fontColor: AppColors.primary100,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        );
      },
    );
  }
}
