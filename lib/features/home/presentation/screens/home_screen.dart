import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hunter/core/user_cubit.dart';

import '../../../../config/router/routes.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../activity/presentation/screens/activity_screen.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../job_seekers/presentation/screens/job_seekers_screen.dart';
import '../../../settings/presentation/screens/settings_screen.dart';
import '../../../submitted_jobs/presentation/screens/submitted_jobs_screen.dart';
import '../../cubit/home_cubit.dart';
import '../../nav_bar_item.dart';
import '../widgets/home_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NavBarItem> _buildNavBarItems(UserRole? userRole) {
    return [
      NavBarItem(
        label: 'Home',
        icon: AppIcons.home,
        view: const ActivityScreen(),
      ),
      if (userRole == UserRole.admin)
        NavBarItem(
          label: 'Post Job',
          icon: AppIcons.messageAdd,
          view: const ActivityScreen(),
        ),
      if (userRole == UserRole.admin)
        NavBarItem(
          label: 'Job Seekers',
          icon: AppIcons.users,
          view: const JobSeekersScreen(),
        ),
      if (userRole == UserRole.jobSeeker)
        NavBarItem(
          label: 'All Submitted Jobs',
          icon: AppIcons.document,
          view: const SubmittedJobsScreen(),
        ),
      NavBarItem(
        label: 'Settings',
        icon: AppIcons.setting,
        view: const SettingsScreen(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserCubit, UserModel?, UserRole?>(
      selector: (user) => user?.role,
      builder: (context, userRole) {
        final navBarItems = _buildNavBarItems(userRole);
        return BlocConsumer<HomeCubit, HomeState>(
          buildWhen:
              (previous, current) => current.maybeWhen(
                changeNavBarIndex: (index) => true,
                orElse: () => false,
              ),
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              changeNavBarIndex: (index) {
                if (index == 1 && userRole == UserRole.admin) {
                  context.pushNamed(Routes.postJob);
                  context.read<HomeCubit>().changeNavBar(index: 0);
                }
              },
            );
          },
          builder: (context, state) {
            int currentIndex = 0;
            if (state is ChangeNavBarIndex) {
              currentIndex = state.index;
            }
            return Scaffold(
              body: SafeArea(
                child: IndexedStack(
                  index: currentIndex,
                  children: navBarItems.map((item) => item.view).toList(),
                ),
              ),
              extendBody: true,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: HomeNavBar(navBarItems: navBarItems),
            );
          },
        );
      },
    );
  }
}
