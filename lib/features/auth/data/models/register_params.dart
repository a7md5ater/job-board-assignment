import 'dart:typed_data' show Uint8List;

class RegisterParams {
  final String personalId;
  final String name;
  final String userName;
  final String category;
  final String languageId;
  final Uint8List image;
  final bool canOpenSettings;

  RegisterParams({
    required this.personalId,
    required this.name,
    required this.userName,
    required this.category,
    required this.languageId,
    required this.image,
    required this.canOpenSettings,
  });
}
