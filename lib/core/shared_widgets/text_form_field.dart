import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';
import '../utils/font_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final bool readOnly;
  final int? maxlength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onFelidSubmitted;
  final void Function()? onTap;
  final TextEditingController controller;
  final TextInputType inputType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool unfocusedWhenTapOutside;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxlength,
    this.obscureText = false,
    this.readOnly = false,
    required this.controller,
    this.onChange,
    this.onFelidSubmitted,
    this.onTap,
    required this.inputType,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.inputFormatters,
    this.unfocusedWhenTapOutside = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      onTapOutside:
          unfocusedWhenTapOutside
              ? (_) => FocusScope.of(context).unfocus()
              : null,
      controller: controller,
      obscureText: obscureText,
      keyboardType: inputType,
      maxLength: maxlength,
      cursorColor: AppColors.primary100,
      style: FontStyles.medium(),
      validator: validator,
      onChanged: onChange,
      onFieldSubmitted: onFelidSubmitted,
      onTap: onTap,
      readOnly: readOnly,
      minLines: inputType == TextInputType.multiline ? 6 : 1,
      maxLines: inputType == TextInputType.multiline ? 6 : 1,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
