// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl_phone_field/country_picker_dialog.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:wanted/core/shared_widgets/vertical_space.dart';

// import '../../../../../core/utils/app_colors.dart';
// import '../../../../../core/utils/font_styles.dart';
// import '../../../cubit/auth_cubit.dart';

// class SignupPhoneTextField extends StatefulWidget {
//   const SignupPhoneTextField({super.key});

//   @override
//   State<SignupPhoneTextField> createState() => _SignupPhoneTextFieldState();
// }

// class _SignupPhoneTextFieldState extends State<SignupPhoneTextField> {
//   late String errorMessage;
//   @override
//   void initState() {
//     errorMessage = "can't be empty";
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'phoneNumber'.tr(),
//           style: FontStyles.medium(fontColor: AppColors.text80, fontSize: 13),
//         ),
//         const VerticalSpace(10),
//         IntlPhoneField(
//           controller: context.read<AuthCubit>().registerMobileController,
//           initialCountryCode: 'EG',
//           flagsButtonPadding: EdgeInsetsDirectional.only(
//             // top: 5.h,
//             start: 10.w,
//           ),
//           style: FontStyles.medium(letterSpacing: 1.3),
//           cursorColor: AppColors.primary100,
//           dropdownIcon: const Icon(
//             Icons.arrow_drop_down,
//             color: AppColors.text80,
//           ),

//           dropdownTextStyle: FontStyles.regular(
//             fontColor: AppColors.text100,
//             fontSize: 15,
//           ),
//           cursorHeight: 20.h,
//           pickerDialogStyle: PickerDialogStyle(
//             backgroundColor: AppColors.backgroundWithe,
//             borderRadius: 12.r,
//             countryCodeStyle: FontStyles.medium(
//               fontColor: AppColors.text100,
//               fontSize: 14,
//             ),
//             countryNameStyle: FontStyles.medium(
//               fontColor: AppColors.text100,
//               fontSize: 15,
//             ),
//             searchFieldCursorHeight: 20.h,
//             searchFieldtextStyle: FontStyles.medium(
//               fontColor: AppColors.text100,
//               fontSize: 16,
//             ),
//             searchFieldInputDecoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(
//                 vertical: 0,
//                 horizontal: 16.w,
//               ),
//               fillColor: AppColors.backgroundWithe,
//               hintText: 'Search',
//               hintStyle: FontStyles.regular(fontColor: AppColors.text50),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.r),
//                 borderSide: const BorderSide(color: AppColors.text50),
//               ),
//               focusedErrorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.r),
//                 borderSide: const BorderSide(color: AppColors.text50),
//               ),
//               errorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.r),
//                 borderSide: const BorderSide(color: AppColors.text50),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.r),
//                 borderSide: const BorderSide(color: AppColors.text50),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.r),
//                 borderSide: const BorderSide(color: AppColors.text50),
//               ),
//             ),
//             listTileDivider: const SizedBox(),
//             searchFieldCursorColor: AppColors.primary100,
//           ),
//           invalidNumberMessage: errorMessage,
//           // showDropdownIcon: false,
//           // dropdownIcon: const Icon(
//           //   Icons.arrow_ios,
//           // ),
//           dropdownIconPosition: IconPosition.trailing,

//           onChanged: (phone) {
//             try {
//               phone.isValidNumber();
//             } catch (_) {
//               setState(() {
//                 errorMessage =
//                     phone.number.isEmpty
//                         ? "can't be empty"
//                         : "invalidPhoneNumber".tr();
//               });
//             }
//             context.read<AuthCubit>().registerMobileController.text =
//                 phone.number;
//             // print(context.read<RegisterBloc>().phoneController.text);
//           },
//           decoration: InputDecoration(
//             hintStyle: FontStyles.regular(fontColor: AppColors.text50),

//             // alignLabelWithHint: true,
//             contentPadding: EdgeInsets.symmetric(
//               vertical: 14.h,
//               horizontal: 20.w,
//             ),
//             errorStyle: FontStyles.regular(fontColor: Colors.red, fontSize: 12),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.r),
//               borderSide: const BorderSide(color: AppColors.text30),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.r),
//               borderSide: const BorderSide(color: AppColors.text30),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.r),
//               borderSide: const BorderSide(color: AppColors.text30),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.r),
//               borderSide: const BorderSide(color: AppColors.text30),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.r),
//               borderSide: const BorderSide(color: AppColors.text30),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
