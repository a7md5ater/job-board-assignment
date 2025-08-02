import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/theme/app_theme.dart';
import '../config/router/app_router.dart';
import '../core/user_cubit.dart';
import 'injector.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.orientationOf(context);
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    bool isMobile =
        (orientation == Orientation.portrait && width < 600) ||
        (orientation == Orientation.landscape && height < 600);
    return ScreenUtilInit(
      designSize: isMobile ? const Size(375, 812) : const Size(600, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => BlocProvider<UserCubit>(
            create: (context) => di<UserCubit>(),
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme(),
              routerConfig: AppRouter().router,
            ),
          ),
    );
  }
}
