import 'package:job_hunter/features/auth/data/models/user_model.dart';

class RegisterBody {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final UserRole role;

  RegisterBody({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.role,
  });
}
