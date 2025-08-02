import 'package:firebase_auth/firebase_auth.dart';

import '../../features/auth/data/models/login_body.dart';
import '../../features/auth/data/models/register_body.dart';

abstract class AuthViaFirebase {
  Future<UserCredential> register({required RegisterBody registerBody});
  Future<UserCredential> login({required LoginBody loginBody});
  Future<void> logout();
}

class AuthViaFirebaseImpl implements AuthViaFirebase {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<UserCredential> register({required RegisterBody registerBody}) async {
    return _auth.createUserWithEmailAndPassword(
      email: registerBody.email,
      password: registerBody.password,
    );
  }

  @override
  Future<UserCredential> login({required LoginBody loginBody}) async {
    return _auth.signInWithEmailAndPassword(
      email: loginBody.email,
      password: loginBody.password,
    );
  }

  @override
  Future<void> logout() async => _auth.signOut();
}
