import 'dart:convert';

class ProfileRequest {
  final String email;
  final String? name;
  final String? gender;

  ProfileRequest({
    required this.email,
    required this.name,
    required this.gender,
  });

  String toMap() {
    return jsonEncode({
      'email': email,
      'name': name,
      'gender': gender,
    });
  }
}
