import '../../../../core/firebase/auth.dart';

abstract class SettingsRemoteDataSource {
  Future<void> logout();
}

class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final AuthViaFirebase _authViaFirebase;

  SettingsRemoteDataSourceImpl({required AuthViaFirebase authViaFirebase})
    : _authViaFirebase = authViaFirebase;

  @override
  Future<void> logout() async {
    await _authViaFirebase.logout();
  }
}
