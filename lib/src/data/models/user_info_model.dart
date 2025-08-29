import 'package:meta/meta.dart';

@immutable
class UserInfoModel {
  const UserInfoModel({
    required this.id,
    required this.username,
    required this.email,
    required this.createdAt,
    required this.role,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      role: UserRole.fromString(json['role'] as String),
    );
  }

  final String id;
  final String username;
  final String email;
  final DateTime createdAt;
  final UserRole role;

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
    'created_at': createdAt.toUtc().toIso8601String(),
    'role': role.toJson(),
  };
}

enum UserRole {
  user('User'),
  admin('Admin');

  const UserRole(this.label);

  final String label;

  static UserRole fromString(String value) {
    return UserRole.values.firstWhere(
          (type) => type.name == value.toLowerCase(),
      orElse: () => UserRole.user,
    );
  }

  String toJson() => name;
}
