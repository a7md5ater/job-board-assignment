import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/app_enums.dart';

part 'job_data.g.dart';

@JsonSerializable()
class JobData {
  String? id;
  String? title;
  String? description;
  String? location;
  String? salary;
  JobStatus? status;
  String? createdBy;
  String? createdAt;
  String? createdById;

  factory JobData.fromJson(Map<String, dynamic> json) {
    return _$JobDataFromJson(json);
  }

  JobData({
    this.id,
    this.title,
    this.description,
    this.location,
    this.salary,
    this.status,
    this.createdBy,
    this.createdAt,
    this.createdById,
  });

  Map<String, dynamic> toJson() => _$JobDataToJson(this);

  JobData copyWith({
    String? id,
    String? title,
    String? description,
    String? location,
    String? salary,
    JobStatus? status,
    String? createdBy,
    String? createdAt,
    String? createdById,
  }) {
    return JobData(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,
      salary: salary ?? this.salary,
      status: status ?? this.status,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      createdById: createdById ?? this.createdById,
    );
  }
}
