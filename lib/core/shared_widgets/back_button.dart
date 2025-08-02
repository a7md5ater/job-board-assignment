import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../utils/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  // final MissionModel missionModel;
  // const CustomBackButton({super.key, required this.missionModel});
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
        // context.read<MissionCubit>().updateMissionState(
        //       missionEntity: MissionDetailsEntity(
        //         id: missionModel.id!,
        //         locationId: missionModel.entityLocationId!,
        //         locationName: missionModel.entityLocationName!,
        //         locationAddress: "",
        //         receiverType: missionModel.entityLocationType!.receiverType,
        //         status: MissionStatus.notStarted,
        //         startDate: null,
        //         endDate: null,
        //         latitude: 123,
        //         longitude: 123,
        //       ),
        //       state: 0,
        //     );
      },
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.text10,
          borderRadius: BorderRadius.circular(10.sp),
          border: Border.all(width: 1.sp, color: AppColors.text30),
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 16.sp,
          color: AppColors.text100,
        ),
      ),
    );
  }
}
