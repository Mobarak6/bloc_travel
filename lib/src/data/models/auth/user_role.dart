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
