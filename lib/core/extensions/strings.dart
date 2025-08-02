import 'package:job_hunter/features/auth/data/models/user_model.dart';

extension StringExt on String {
  UserRole get userRole {
    switch (this) {
      case 'Admin':
        return UserRole.admin;
      case 'Job Seeker':
        return UserRole.jobSeeker;
      default:
        throw Exception('Unknown user role: $this');
    }
  }
}
