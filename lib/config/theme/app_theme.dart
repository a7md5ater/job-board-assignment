import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/font_styles.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: AppColors.generateMaterialColor(AppColors.primary100),
      scaffoldBackgroundColor: AppColors.backgroundWithe,
      textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: AppColors.primary100,
      ),
      // color
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary100,
        foregroundColor: AppColors.backgroundWithe,
        elevation: 0,
        // shape: RoundedRectangleBorder(),
      ),
      iconTheme: const IconThemeData(color: AppColors.text100),

      textTheme: TextTheme(
        displayLarge: FontStyles.bold(fontColor: AppColors.primary100),
        displayMedium: FontStyles.semiBold(fontColor: AppColors.text100),
        bodyLarge: FontStyles.medium(fontColor: AppColors.text80),
        bodyMedium: FontStyles.regular(fontColor: AppColors.textBody),
      ),
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.backgroundWithe,
        surfaceTintColor: AppColors.backgroundWithe,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: AppColors.backgroundWithe,
        ),
        titleTextStyle: FontStyles.semiBold(
          fontSize: 16.sp,
          fontColor: AppColors.text100,
        ),
        actionsIconTheme: const IconThemeData(color: Colors.white),
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: AppColors.backgroundWithe,
        elevation: 1,
        type: BottomNavigationBarType.fixed,
      ),

      ///card
      cardTheme: CardTheme(
        elevation: 0,
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.sp),
        ),
      ),

      /// elevated button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primary100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.sp),
          ),
          minimumSize: Size(double.infinity, 52.h),
        ),
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: AppColors.backgroundWithe,
        surfaceTintColor: Colors.transparent,
      ),

      /// text button
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.primary100),
      ),

      /// input decoration
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: FontStyles.regular(fontColor: AppColors.text50),
        fillColor: AppColors.backgroundWithe,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        errorStyle: FontStyles.regular(fontColor: Colors.red, fontSize: 12.sp),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: const BorderSide(color: AppColors.text30),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: const BorderSide(color: AppColors.text30),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: const BorderSide(color: AppColors.text30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: const BorderSide(color: AppColors.primary100),
        ),
      ),
    );
  }
}
