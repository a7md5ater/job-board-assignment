import 'package:json_annotation/json_annotation.dart';

part 'job_application_model.g.dart';

@JsonSerializable()
class JobApplicationModel {
  final String id;
  final String userId;
  final String fullName;
  final String email;
  final String resume;
  final String coverLetter;

  factory JobApplicationModel.fromJson(Map<String, dynamic> json) {
    return _$JobApplicationModelFromJson(json);
  }

  JobApplicationModel({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.email,
    required this.resume,
    required this.coverLetter,
  });

  Map<String, dynamic> toJson() => _$JobApplicationModelToJson(this);

  JobApplicationModel copyWith({
    String? id,
    String? userId,
    String? fullName,
    String? email,
    String? resume,
    String? coverLetter,
  }) {
    return JobApplicationModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      resume: resume ?? this.resume,
      coverLetter: coverLetter ?? this.coverLetter,
    );
  }
}
