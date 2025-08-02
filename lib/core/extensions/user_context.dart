import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/data/models/user_model.dart';
import '../user_cubit.dart';

extension UserContext on BuildContext {
  /// Get current user (reactive - will rebuild when user changes)
  UserModel? get user => watch<UserCubit>().state;

  /// Get current user (non-reactive - won't rebuild)
  UserModel? get userOnce => read<UserCubit>().state;

  /// Check if user is logged in (reactive)
  bool get isLoggedIn => user != null;

  /// Check if user is logged in (non-reactive)
  bool get isLoggedInOnce => userOnce != null;

  /// Get user cubit for actions
  UserCubit get userCubit => read<UserCubit>();
}
