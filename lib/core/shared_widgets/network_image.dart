import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../utils/app_colors.dart';
import '../utils/app_icons.dart';
import '../utils/font_styles.dart';
import 'circle_indicator.dart';
import 'icon.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? height;
  final double? width;
  final bool isSmall;
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    required this.fit,
    this.height,
    this.width,
    this.isSmall = false,
  });

  Future<bool> checkInternet() async {
    bool? result;
    InternetConnectionChecker.createInstance().hasConnection.then(
      (value) => result = value,
    );
    return result!;
    // return await InternetConnectionChecker().hasConnection;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        placeholder:
            (context, s) => Container(
              color: AppColors.text10,
              child: Center(child: CustomCircleIndicator(size: 20.sp)),
            ),
        errorWidget: (BuildContext context, String url, dynamic error) {
          return Container(
            color: AppColors.text10,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIcon(
                    icon: AppIcons.gallery,
                    size: isSmall ? 20.sp : 50.sp,
                    color: AppColors.primary100,
                  ),
                  if (!isSmall)
                    Text(
                      "connection error",
                      style: FontStyles.regular(
                        fontColor: AppColors.text100,
                        fontSize: 12.sp,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
