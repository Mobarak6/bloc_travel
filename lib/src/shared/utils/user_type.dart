enum UserType {
  user('User'),
  admin('Admin');

  const UserType(this.label);
  
  final String label;
  
  static UserType fromString(String value) {
    return UserType.values.firstWhere(
      (type) => type.name == value.toLowerCase(),
      orElse: () => UserType.user,
    );
  }
}
