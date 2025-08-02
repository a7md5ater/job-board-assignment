// core/services/hive_service.dart

import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/failures/failures.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> init();
  Future<void> saveUser({required UserModel userModel});
  Future<void> deleteUser();
  UserModel? get user;
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String _userBoxKey = "user";
  Box<UserModel?>? _userBox;
  bool _isInitialized = false;

  @override
  Future<void> init() async {
    if (_isInitialized) return;
    try {
      if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
        Hive.registerAdapter(UserModelAdapter());
      }

      if (!Hive.isAdapterRegistered(UserRoleAdapter().typeId)) {
        Hive.registerAdapter(UserRoleAdapter());
      }

      _userBox = await Hive.openBox(_userBoxKey);
      _isInitialized = true;
    } catch (e) {
      throw CacheFailure(error: "Failed to initialize Hive: ${e.toString()}");
    }
  }

  void ensureInitialized() {
    if (!_isInitialized || _userBox == null) {
      throw CacheFailure(
        error: "Task box is not initialized. Call init() first.",
      );
    }
  }

  @override
  Future<void> saveUser({required UserModel userModel}) async {
    try {
      ensureInitialized();
      await _userBox!.put(_userBoxKey, userModel);
      await _userBox!.flush();
    } on CacheFailure {
      rethrow;
    } catch (e) {
      throw CacheFailure(error: "Failed to add task: ${e.toString()}");
    }
  }

  @override
  Future<void> deleteUser() async {
    try {
      ensureInitialized();
      await _userBox!.clear();
      await _userBox!.flush();
    } on CacheFailure {
      rethrow;
    } catch (e) {
      throw CacheFailure(error: "Failed to delete task: ${e.toString()}");
    }
  }

  @override
  UserModel? get user {
    try {
      ensureInitialized();
      return _userBox!.get(_userBoxKey);
    } on CacheFailure {
      rethrow;
    } catch (e) {
      throw CacheFailure(error: "Failed to get all tasks: ${e.toString()}");
    }
  }
}
