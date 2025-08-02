// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobData _$JobDataFromJson(Map<String, dynamic> json) => JobData(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
      salary: json['salary'] as String?,
      status: $enumDecodeNullable(_$JobStatusEnumMap, json['status']),
      createdBy: json['createdBy'] as String?,
      createdAt: json['createdAt'] as String?,
      createdById: json['createdById'] as String?,
    );

Map<String, dynamic> _$JobDataToJson(JobData instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'location': instance.location,
      'salary': instance.salary,
      'status': _$JobStatusEnumMap[instance.status],
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt,
      'createdById': instance.createdById,
    };

const _$JobStatusEnumMap = {
  JobStatus.open: 'open',
  JobStatus.closed: 'closed',
};
