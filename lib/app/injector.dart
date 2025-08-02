import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:job_hunter/core/firebase/auth.dart';
import 'package:job_hunter/features/job_applications/domain/usecases/get_submitted_applications_usecase.dart';
import 'package:job_hunter/features/submitted_jobs/data/datasources/submitted_jobs_remote_data_source.dart';
import 'package:job_hunter/features/settings/cubit/settings_cubit.dart';

import '../../core/network/network_info.dart';
import '../core/firebase/database.dart';
import '../core/user_cubit.dart';
import '../features/activity/cubit/activity_cubit.dart';
import '../features/activity/data/datasources/activity_remote_data_source.dart';
import '../features/activity/data/repository/activity_repository_impl.dart';
import '../features/activity/domain/repository/activity_repository.dart';
import '../features/activity/domain/usecases/get_jobs_use_case.dart';
import '../features/job_applications/cubit/job_applications_cubit.dart';
import '../features/job_applications/data/datasources/job_applications_remote_data_source.dart';
import '../features/job_applications/data/repositories/job_applications_repository_impl.dart';
import '../features/job_applications/domain/repositories/job_applications_repository.dart';
import '../features/job_details/domain/usecases/is_applied_usecase.dart';
import '../features/submitted_jobs/cubit/submitted_jobs_cubit.dart';
import '../features/submitted_jobs/data/repositories/submitted_jobs_repository_impl.dart';
import '../features/submitted_jobs/domain/repositories/submitted_jobs_repository.dart';
import '../features/submitted_jobs/domain/usecases/get_submitted_jobs_usecase.dart';
import '../features/auth/cubit/auth_cubit.dart';
import '../features/auth/data/datasources/auth_local_data_source.dart';
import '../features/auth/data/datasources/auth_remote_data_source.dart';
import '../features/auth/data/repository/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/auth/domain/usecases/login_use_case.dart';
import '../features/auth/domain/usecases/register_use_case.dart';
import '../features/home/cubit/home_cubit.dart';
import '../features/job_details/cubit/job_details_cubit.dart';
import '../features/job_details/data/datasources/job_details_remote_data_source.dart';
import '../features/job_details/data/repositories/job_details_repository_impl.dart';
import '../features/job_details/domain/repositories/job_details_repository.dart';
import '../features/job_details/domain/usecases/apply_for_job_usecase.dart';
import '../features/job_details/domain/usecases/delete_job_usecase.dart';
import '../features/job_seekers/cubit/job_seekers_cubit.dart';
import '../features/job_seekers/data/datasources/job_seekers_remote_data_source.dart';
import '../features/job_seekers/data/repositories/job_seekers_repository_impl.dart';
import '../features/job_seekers/domain/repositories/job_seekers_repository.dart';
import '../features/job_seekers/domain/usecases/get_job_seekers_usecase.dart';
import '../features/post_job/cubit/post_job_cubit.dart';
import '../features/post_job/data/datasources/post_job_remote_data_source.dart';
import '../features/post_job/data/repositories/post_job_repository_impl.dart';
import '../features/post_job/domain/repositories/post_job_repository.dart';
import '../features/post_job/domain/usecases/post_new_job_use_case.dart';
import '../features/post_job/domain/usecases/update_job_usecase.dart';
import '../features/settings/data/datasources/settings_remote_data_source.dart';
import '../features/settings/data/repositories/settings_repository_impl.dart';
import '../features/settings/domain/repositories/settings_repository.dart';
import '../features/settings/domain/usecases/logout_usecase.dart';

final di = GetIt.instance;

void setupGetIt() async {
  // NETWORK INFO
  di.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectionChecker: di()),
  );
  di.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.createInstance(),
  );

  // FIREBASE
  di.registerLazySingleton<AuthViaFirebase>(() => AuthViaFirebaseImpl());
  di.registerLazySingleton<FirebaseDatabase>(() => FirebaseDatabaseImpl());

  di.registerLazySingleton<UserCubit>(
    () => UserCubit(authLocalDataSource: di()),
  );

  /// AUTH
  // CUBIT
  di.registerFactory(
    () => AuthCubit(loginUseCase: di(), registerUseCase: di(), userCubit: di()),
  );

  // DATA SOURCES
  di.registerLazySingleton<AuthRemoteDataSource>(
    () =>
        AuthRemoteDataSourceImpl(authViaFirebase: di(), firebaseDatabase: di()),
  );
  di.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(),
  );

  // REPOSITORY
  di.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: di(),
      authLocalDataSource: di(),
      networkInfo: di(),
    ),
  );

  // USE CASE
  di.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(authRepository: di()),
  );
  di.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(authRepository: di()),
  );

  /// HOME
  // CUBIT
  di.registerFactory(() => HomeCubit(getJobsUseCase: di()));

  /// ACTIVITY
  // CUBIT
  di.registerFactory(() => ActivityCubit(GetJobsUseCase: di()));

  // DATA SOURCES
  di.registerLazySingleton<ActivityRemoteDataSource>(
    () => ActivityRemoteDataSourceImpl(firebaseDatabase: di()),
  );

  // REPOSITORY
  di.registerLazySingleton<ActivityRepository>(
    () => ActivityRepositoryImpl(
      networkInfo: di(),
      activityRemoteDataSource: di(),
      authLocalDataSource: di(),
    ),
  );

  // USE CASE
  di.registerLazySingleton<GetJobsUseCase>(
    () => GetJobsUseCase(activityRepository: di()),
  );

  /// SETTINGS
  // CUBIT
  di.registerFactory(() => SettingsCubit(logoutUseCase: di(), userCubit: di()));

  // DATA SOURCES
  di.registerLazySingleton<SettingsRemoteDataSource>(
    () => SettingsRemoteDataSourceImpl(authViaFirebase: di()),
  );

  // REPOSITORY
  di.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(
      networkInfo: di(),
      settingsRemoteDataSource: di(),
    ),
  );

  // USE CASE
  di.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(settingsRepository: di()),
  );

  /// POST JOB
  // CUBIT
  di.registerFactory(
    () => PostJobCubit(postNewJobUseCase: di(), updateJobUsecase: di()),
  );

  // DATA SOURCES
  di.registerLazySingleton<PostJobRemoteDataSource>(
    () => PostJobRemoteDataSourceImpl(firebaseDatabase: di()),
  );

  // REPOSITORY
  di.registerLazySingleton<PostJobRepository>(
    () => PostJobRepositoryImpl(
      networkInfo: di(),
      postJobRemoteDataSource: di(),
      authLocalDataSource: di(),
    ),
  );

  // USE CASE
  di.registerLazySingleton<PostNewJobUseCase>(
    () => PostNewJobUseCase(postJobRepository: di()),
  );
  di.registerLazySingleton<UpdateJobUsecase>(
    () => UpdateJobUsecase(postJobRepository: di()),
  );

  /// JOB DETAILS
  // CUBIT
  di.registerFactory(
    () => JobDetailsCubit(
      deleteJobUseCase: di(),
      applyForJobUseCase: di(),
      isAppliedUseCase: di(),
    ),
  );

  // DATA SOURCES
  di.registerLazySingleton<JobDetailsRemoteDataSource>(
    () => JobDetailsRemoteDataSourceImpl(firebaseDatabase: di()),
  );

  // REPOSITORY
  di.registerLazySingleton<JobDetailsRepository>(
    () => JobDetailsRepositoryImpl(
      networkInfo: di(),
      jobDetailsRemoteDataSource: di(),
      authLocalDataSource: di(),
    ),
  );

  // USE CASE
  di.registerLazySingleton<DeleteJobUseCase>(
    () => DeleteJobUseCase(jobDetailsRepository: di()),
  );
  di.registerLazySingleton<ApplyForJobUseCase>(
    () => ApplyForJobUseCase(jobDetailsRepository: di()),
  );
  di.registerLazySingleton<IsAppliedUseCase>(
    () => IsAppliedUseCase(jobDetailsRepository: di()),
  );

  /// JOB SEEKERS
  // CUBIT
  di.registerFactory(() => JobSeekersCubit(getJobSeekersUseCase: di()));

  // DATA SOURCES
  di.registerLazySingleton<JobSeekersRemoteDataSource>(
    () => JobSeekersRemoteDataSourceImpl(firebaseDatabase: di()),
  );

  // REPOSITORY
  di.registerLazySingleton<JobSeekersRepository>(
    () => JobSeekersRepositoryImpl(
      networkInfo: di(),
      jobSeekersRemoteDataSource: di(),
    ),
  );

  // USE CASE
  di.registerLazySingleton<GetJobSeekersUseCase>(
    () => GetJobSeekersUseCase(jobSeekersRepository: di()),
  );

  /// SUBMITTED JOBS
  // CUBIT
  di.registerFactory(() => SubmittedJobsCubit(getSubmittedJobsUseCase: di()));

  // DATA SOURCES
  di.registerLazySingleton<SubmittedJobsRemoteDataSource>(
    () => SubmittedJobsRemoteDataSourceImpl(firebaseDatabase: di()),
  );

  // REPOSITORY
  di.registerLazySingleton<SubmittedJobsRepository>(
    () => SubmittedJobsRepositoryImpl(
      networkInfo: di(),
      SubmittedJobsRemoteDataSource: di(),
      authLocalDataSource: di(),
    ),
  );

  // USE CASE
  di.registerLazySingleton<GetSubmittedJobsUseCase>(
    () => GetSubmittedJobsUseCase(submittedJobsRepository: di()),
  );

  /// JOB APPLICATIONS
  // CUBIT
  di.registerFactory(
    () => JobApplicationsCubit(getSubmittedApplicationsUseCase: di()),
  );

  // DATA SOURCES
  di.registerLazySingleton<JobApplicationsRemoteDataSource>(
    () => JobApplicationsRemoteDataSourceImpl(firebaseDatabase: di()),
  );

  // REPOSITORY
  di.registerLazySingleton<JobApplicationsRepository>(
    () => JobApplicationsRepositoryImpl(
      networkInfo: di(),
      jobApplicationsRemoteDataSource: di(),
      authLocalDataSource: di(),
    ),
  );

  // USE CASE
  di.registerLazySingleton<GetSubmittedApplicationsUseCase>(
    () => GetSubmittedApplicationsUseCase(jobApplicationsRepository: di()),
  );
}
