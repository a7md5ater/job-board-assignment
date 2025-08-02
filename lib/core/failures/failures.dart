import 'package:firebase_auth/firebase_auth.dart';

import 'firebase/auth/auth_exceptions.dart';
import 'firebase/firebase/firebase_exceptions.dart';

abstract class Failure {
  String get message;
}

class CacheFailure extends Failure {
  final String error;

  CacheFailure({required this.error});

  @override
  String get message => error;
}

class NoInternetConnection implements Exception {}

class ServerFailure extends Failure {
  final Object error;

  ServerFailure({required this.error});

  String handleException() {
    late String errorMsg;
    if (error is NoInternetConnection) {
      errorMsg =
          "There is no internet connection , please check your connection and try again later.";
    } else if (error is FirebaseAuthException) {
      errorMsg = AuthExceptionHandler.generateExceptionMessage(
        AuthExceptionHandler.handleException(error),
      );
    } else if (error is FirebaseException) {
      errorMsg = FirebaseExceptionHandler.generateExceptionMessage(
        FirebaseExceptionHandler.handleException(error),
      );
    } else {
      errorMsg = error.toString();
    }
    return errorMsg;
  }

  @override
  String get message => handleException();
}
