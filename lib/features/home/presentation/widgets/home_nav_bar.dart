import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/shared_widgets/icon.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../cubit/home_cubit.dart';
import '../../nav_bar_item.dart';

class HomeNavBar extends StatelessWidget {
  final List<NavBarItem> navBarItems;
  const HomeNavBar({super.key, required this.navBarItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor ??
            Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: BlocBuilder<HomeCubit, HomeState>(
          buildWhen:
              (previous, current) => current.maybeWhen(
                changeNavBarIndex: (selectedIndex) => true,
                orElse: () => false,
              ),
          builder: (context, state) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              onTap:
                  (index) =>
                      context.read<HomeCubit>().changeNavBar(index: index),
              items: List.generate(navBarItems.length, (index) {
                final item = navBarItems[index];
                bool isSelected = index == 0;
                if (state is ChangeNavBarIndex) {
                  isSelected = state.index == index;
                }
                return BottomNavigationBarItem(
                  icon: CustomIcon(
                    icon: item.icon,
                    size: 24.h,
                    color:
                        isSelected ? AppColors.primary100 : AppColors.text100,
                  ),
                  label: item.label,
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
