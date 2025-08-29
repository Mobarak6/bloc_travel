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

  final String id;
  final String username;
  final String email;
  final DateTime createdAt;
  final UserRole role;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      role: UserRoleX.fromJson(json['role'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
    'created_at': createdAt.toUtc().toIso8601String(),
    'role': role.toJson(),
  };
}

enum UserRole { user, admin }

extension UserRoleX on UserRole {
  static UserRole fromJson(String value) {
    switch (value.toLowerCase()) {
      case 'admin':
        return UserRole.admin;
      case 'user':
      default:
        return UserRole.user;
    }
  }

  String toJson() {
    switch (this) {
      case UserRole.admin:
        return 'admin';
      case UserRole.user:
        return 'user';
    }
  }
}
