import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hunter/core/shared_widgets/app_bar.dart';

import '../../../../core/shared_widgets/vertical_space.dart';
import '../widgets/or_divider.dart';
import '../widgets/register/already_have_account.dart';
import '../widgets/register/register_button.dart';
import '../widgets/register/register_text_fields.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: 'Register'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const VerticalSpace(20),
                const VerticalSpace(20),
                RegisterTextFields(registerFormKey: _registerFormKey),
                const VerticalSpace(20),
                RegisterButton(registerFormKey: _registerFormKey),
                const VerticalSpace(20),
                const OrDivider(),
                const VerticalSpace(20),
                const AlreadyHaveAccount(),
                const VerticalSpace(40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
