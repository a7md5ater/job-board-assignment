import 'package:json_annotation/json_annotation.dart';

part 'get_categories_body.g.dart';

@JsonSerializable()
class GetCategoriesBody {
  @JsonKey(name: 'IMEI')
  final String token;
  @JsonKey(name: 'UserName')
  final String userName;

  GetCategoriesBody({required this.token, required this.userName});

  factory GetCategoriesBody.fromJson(Map<String, dynamic> json) {
    return _$GetCategoriesBodyFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCategoriesBodyToJson(this);
}
