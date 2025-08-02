import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/vertical_space.dart';
import '../widgets/login/forget_password_button.dart';
import '../widgets/login/login_button.dart';
import '../widgets/login/login_text_fields.dart';
import '../widgets/login/login_welcome_text.dart';
import '../widgets/login/not_have_account.dart';
import '../widgets/or_divider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _loginFormKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginWelcomeText(),
              VerticalSpace(20),
              LoginTextFields(loginFormKey: _loginFormKey),
              ForgetPasswordButton(),
              VerticalSpace(20),
              LoginButton(loginFormKey: _loginFormKey),
              VerticalSpace(20),
              OrDivider(),
              VerticalSpace(20),
              NotHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
