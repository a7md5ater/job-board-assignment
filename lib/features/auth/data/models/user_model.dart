import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
enum UserRole {
  @HiveField(0)
  admin,
  @HiveField(1)
  jobSeeker,
}

@JsonSerializable()
@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String fullName;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final UserRole role;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.role,
  });

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? id,
    String? fullName,
    String? email,
    UserRole? role,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      role: role ?? this.role,
    );
  }
}
