import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_hunter/core/firebase/auth.dart';

import '../../../../core/firebase/database.dart';
import '../models/login_body.dart';
import '../models/register_body.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> login({required LoginBody loginBody});
  Future<UserCredential> register({required RegisterBody registerBody});
  Future<void> addUserToFirestore({required UserModel user});
  Future<UserModel> getCurrentUser({required String id});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthViaFirebase _authViaFirebase;
  final FirebaseDatabase _firebaseDatabase;

  AuthRemoteDataSourceImpl({
    required AuthViaFirebase authViaFirebase,
    required FirebaseDatabase firebaseDatabase,
  }) : _authViaFirebase = authViaFirebase,
       _firebaseDatabase = firebaseDatabase;

  @override
  Future<UserCredential> login({required LoginBody loginBody}) async {
    return _authViaFirebase.login(loginBody: loginBody);
  }

  @override
  Future<UserCredential> register({required RegisterBody registerBody}) async {
    return _authViaFirebase.register(registerBody: registerBody);
  }

  @override
  Future<void> addUserToFirestore({required UserModel user}) {
    return _firebaseDatabase.addUserToFirestore(user: user);
  }

  @override
  Future<UserModel> getCurrentUser({required String id}) {
    return _firebaseDatabase.getCurrentUser(id: id);
  }
}
