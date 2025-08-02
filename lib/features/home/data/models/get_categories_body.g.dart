// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_categories_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoriesBody _$GetCategoriesBodyFromJson(Map<String, dynamic> json) =>
    GetCategoriesBody(
      token: json['IMEI'] as String,
      userName: json['UserName'] as String,
    );

Map<String, dynamic> _$GetCategoriesBodyToJson(GetCategoriesBody instance) =>
    <String, dynamic>{
      'IMEI': instance.token,
      'UserName': instance.userName,
    };
