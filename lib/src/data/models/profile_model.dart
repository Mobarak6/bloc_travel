import 'package:freezed_annotation/freezed_annotation.dart';


part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class Profile with _$Profile {
  const Profile._();

  const factory Profile({
    String? id,
    String? username,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    UserRole? role,
    @JsonKey(name: 'created_at') String? createdAt,
    String? email,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  // Mock profile data
  factory Profile.mockProfile() => const Profile(
    id: "770bbbde-e928-4912-b7a9-f4abccdcc292",
    username: "Md Mobarak Ali",
    avatarUrl: null,
    role: UserRole.user,
    createdAt: "2025-08-29 19:20:03.306416+00",
    email: "developer.mobarak@gmail.com",
  );
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

