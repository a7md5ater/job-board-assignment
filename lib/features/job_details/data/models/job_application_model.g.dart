// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobApplicationModel _$JobApplicationModelFromJson(Map<String, dynamic> json) =>
    JobApplicationModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      resume: json['resume'] as String,
      coverLetter: json['coverLetter'] as String,
    );

Map<String, dynamic> _$JobApplicationModelToJson(
        JobApplicationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'fullName': instance.fullName,
      'email': instance.email,
      'resume': instance.resume,
      'coverLetter': instance.coverLetter,
    };
