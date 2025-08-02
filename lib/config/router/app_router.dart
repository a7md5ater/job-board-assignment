import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hunter/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:job_hunter/features/job_details/cubit/job_details_cubit.dart';
import 'package:job_hunter/features/job_details/data/models/job_application_model.dart';
import 'package:job_hunter/features/job_details/presentation/screens/job_details_screen.dart';

import '../../app/injector.dart';
import '../../features/auth/cubit/auth_cubit.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/home/cubit/home_cubit.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/job_applications/cubit/job_applications_cubit.dart';
import '../../features/job_applications/presentation/screens/job_application_details_screen.dart';
import '../../features/job_applications/presentation/screens/job_applications_screen.dart';
import '../../features/job_details/presentation/screens/job_application_screen.dart';
import '../../features/post_job/cubit/post_job_cubit.dart';
import '../../features/post_job/data/models/job_data.dart';
import '../../features/post_job/presentation/screens/post_job_screen.dart';
import 'routes.dart';

class AppRouter {
  static AppRouter? _instance;
  AppRouter._internal();
  factory AppRouter() {
    _instance ??= AppRouter._internal();
    return _instance!;
  }

  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey(
    debugLabel: 'root',
  );

  static final GlobalKey<NavigatorState> sectionANavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

  final router = GoRouter(
    initialLocation: Routes.login,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) {
      final user = di<AuthLocalDataSource>().user;
      final isLoggedIn = user != null;

      if (isLoggedIn) {
        if (state.matchedLocation == Routes.login ||
            state.matchedLocation == Routes.register) {
          return Routes.home;
        }
      } else {
        if (state.matchedLocation != Routes.login &&
            state.matchedLocation != Routes.register) {
          return Routes.login;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: Routes.login,
        name: Routes.login,
        builder:
            (context, state) => BlocProvider(
              create: (context) => di<AuthCubit>(),
              child: const LoginScreen(),
            ),
      ),
      GoRoute(
        path: Routes.register,
        name: Routes.register,
        builder:
            (context, state) => BlocProvider(
              create: (context) => di<AuthCubit>(),
              child: const RegisterScreen(),
            ),
      ),
      GoRoute(
        path: Routes.home,
        name: Routes.home,
        builder:
            (context, state) => BlocProvider(
              create: (context) => di<HomeCubit>()..getJobs(),
              child: const HomeScreen(),
            ),
      ),
      GoRoute(
        path: Routes.postJob,
        name: Routes.postJob,
        builder: (context, state) {
          final jobData = state.extra as JobData?;
          return BlocProvider(
            create: (context) => di<PostJobCubit>(),
            child: PostJobScreen(jobData: jobData),
          );
        },
      ),
      GoRoute(
        path: Routes.jobDetails,
        name: Routes.jobDetails,
        builder: (context, state) {
          final jobData = state.extra as JobData;
          return BlocProvider(
            create:
                (context) =>
                    di<JobDetailsCubit>()
                      ..checkIfApplied(jobId: jobData.id ?? ''),
            child: JobDetailsScreen(jobData: jobData),
          );
        },
      ),
      GoRoute(
        path: Routes.jobApplication,
        name: Routes.jobApplication,
        builder: (context, state) {
          final jobData = state.extra as JobData;
          return BlocProvider(
            create: (context) => di<JobDetailsCubit>(),
            child: JobApplicationScreen(jobData: jobData),
          );
        },
      ),
      GoRoute(
        path: Routes.jobApplications,
        name: Routes.jobApplications,
        builder: (context, state) {
          final jobId = state.extra as String;
          return BlocProvider(
            create:
                (context) =>
                    di<JobApplicationsCubit>()
                      ..getJobApplications(jobId: jobId),
            child: const JobApplicationsScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.jobApplicationDetails,
        name: Routes.jobApplicationDetails,
        builder: (context, state) {
          final application = state.extra as JobApplicationModel;
          return JobApplicationDetailsScreen(application: application);
        },
      ),
    ],
  );
}
