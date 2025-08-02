// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../../../core/shared_widgets/vertical_space.dart';
// import '../../../../../../core/utils/app_colors.dart';
// import '../../../../../../core/utils/font_styles.dart';
// import '../../cubit/activity_cubit.dart';
// import '../../data/models/month_info.dart';

// class MonthCalendarItem extends StatelessWidget {
//   final MonthInfo monthInfo;
//   final int index;
//   const MonthCalendarItem({
//     super.key,
//     required this.monthInfo,
//     required this.index,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ActivityCubit, ActivityState>(
//       buildWhen:
//           (previous, current) =>
//               current.maybeWhen(
//                 changeMonthCalendarIndex:
//                     (selectedIndex) => selectedIndex == index,
//                 orElse: () => false,
//               ) ||
//               previous.maybeWhen(
//                 changeMonthCalendarIndex:
//                     (selectedIndex) => selectedIndex == index,
//                 orElse: () => false,
//               ),
//       builder: (context, state) {
//         final isSelected = state.maybeWhen(
//           changeMonthCalendarIndex: (selectedIndex) => selectedIndex == index,
//           orElse: () => false,
//         );
//         return GestureDetector(
//           onTap: () => context.read<ActivityCubit>().changeMonth(index: index),
//           child: Container(
//             width: 60.w,
//             decoration: BoxDecoration(
//               color:
//                   isSelected ? AppColors.primary100 : AppColors.backgroundWithe,
//               borderRadius: BorderRadius.circular(10.sp),
//               border:
//                   isSelected
//                       ? null
//                       : Border.all(color: AppColors.text20, width: 1.sp),
//             ),
//             alignment: Alignment.center,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   monthInfo.name,
//                   style: FontStyles.medium(
//                     fontSize: 13,
//                     fontColor:
//                         isSelected
//                             ? AppColors.backgroundWithe
//                             : AppColors.text100,
//                   ),
//                 ),
//                 const VerticalSpace(2),
//                 Text(
//                   monthInfo.order.toString(),
//                   style: FontStyles.medium(
//                     fontSize: 13,
//                     fontColor:
//                         isSelected
//                             ? AppColors.backgroundWithe
//                             : AppColors.text100,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
