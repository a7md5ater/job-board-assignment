import '../../features/auth/data/models/user_model.dart';

extension UserRoleExt on UserRole {
  String get displayName {
    switch (this) {
      case UserRole.admin:
        return 'Admin';
      case UserRole.jobSeeker:
        return 'Job Seeker';
    }
  }
}
