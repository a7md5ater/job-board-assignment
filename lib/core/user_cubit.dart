import 'package:bloc/bloc.dart';

import '../features/auth/data/datasources/auth_local_data_source.dart';
import '../features/auth/data/models/user_model.dart';

class UserCubit extends Cubit<UserModel?> {
  final AuthLocalDataSource _authLocalDataSource;

  UserCubit({required AuthLocalDataSource authLocalDataSource})
    : _authLocalDataSource = authLocalDataSource,
      super(null) {
    loadUser();
  }

  void loadUser() {
    final user = _authLocalDataSource.user;
    emit(user);
  }

  void updateUser(UserModel user) async {
    await _authLocalDataSource.saveUser(userModel: user);
    emit(user);
  }

  void clearUser() async {
    await _authLocalDataSource.deleteUser();
    emit(null);
  }

  // Getters for easy access
  UserModel? get currentUser => state;
  bool get isLoggedIn => state != null;
}
