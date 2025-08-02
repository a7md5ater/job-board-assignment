import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';
import '../utils/font_styles.dart';
import 'text_form_field.dart';
import 'vertical_space.dart';

class CustomTextFieldWithTitle extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String hint;
  final TextInputType inputType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final bool unfocusedWhenTapOutside;
  const CustomTextFieldWithTitle({
    super.key,
    required this.title,
    required this.controller,
    required this.hint,
    required this.inputType,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.inputFormatters,
    this.readOnly = false,
    this.unfocusedWhenTapOutside = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: FontStyles.medium(fontColor: AppColors.text80, fontSize: 13),
        ),
        const VerticalSpace(10),
        CustomTextField(
          unfocusedWhenTapOutside: unfocusedWhenTapOutside,
          inputFormatters: inputFormatters,
          hintText: hint,
          controller: controller,
          inputType: inputType,
          validator: validator,
          obscureText: obscureText,
          suffixIcon: suffixIcon,
          readOnly: readOnly,
        ),
      ],
    );
  }
}
