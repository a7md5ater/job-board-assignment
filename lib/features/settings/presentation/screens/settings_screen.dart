import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hunter/config/router/routes.dart';
import 'package:job_hunter/core/extensions/alert_dialog.dart';
import 'package:job_hunter/core/extensions/snackbar.dart';
import 'package:job_hunter/core/utils/app_enums.dart';
import 'package:job_hunter/core/utils/font_styles.dart';
import 'package:job_hunter/features/settings/cubit/settings_cubit.dart';

import '../../../../app/injector.dart';
import '../../../../core/shared_widgets/vertical_space.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../activity/presentation/widgets/info_head.dart';
import '../widgets/settings_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<SettingsCubit>(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalSpace(10),
            const InfoHead(),
            const VerticalSpace(30),
            Text("Settings", style: FontStyles.semiBold(fontSize: 28)),
            const VerticalSpace(20),
            BlocConsumer<SettingsCubit, SettingsState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  logout: () {
                    context.pushReplacementNamed(Routes.login);
                    context.showAnimatedSnackbar(
                      title: "SUCCESS",
                      message: "You have successfully logged out.",
                      type: SnackBarType.success,
                    );
                  },
                  logoutError: (message) {
                    context.pop();
                    context.showAnimatedSnackbar(
                      title: "ERROR",
                      message: message,
                      type: SnackBarType.error,
                    );
                  },
                );
              },
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: SettingsItem(
                    name: 'Logout',
                    icon: AppIcons.logout,
                    onTap: () {
                      context.alertDialog(
                        title: 'Logout',
                        text: "Are you sure you want to logout?",
                        okPressed: () => context.read<SettingsCubit>().logout(),
                        cancelPressed: () => context.pop(),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
