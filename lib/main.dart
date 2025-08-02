import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:job_hunter/app/app.dart';

import 'app/bloc_observer.dart';
import 'app/injector.dart';
import 'features/auth/data/datasources/auth_local_data_source.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  await di<AuthLocalDataSource>().init();

  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}
