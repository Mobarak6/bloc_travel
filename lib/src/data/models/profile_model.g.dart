// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Profile _$ProfileFromJson(Map<String, dynamic> json) => _Profile(
  id: json['id'] as String?,
  username: json['username'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  role: $enumDecodeNullable(_$UserRoleEnumMap, json['role']),
  createdAt: json['created_at'] as String?,
  email: json['email'] as String?,
);

Map<String, dynamic> _$ProfileToJson(_Profile instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'avatar_url': instance.avatarUrl,
  'role': instance.role,
  'created_at': instance.createdAt,
  'email': instance.email,
};

const _$UserRoleEnumMap = {UserRole.user: 'user', UserRole.admin: 'admin'};
