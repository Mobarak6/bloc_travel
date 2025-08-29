/// Utility class to wrap result data.
sealed class Result<T> {
  const Result();

  factory Result.ok(T value) = Ok._;

  factory Result.error(Exception error) = Error._;
}

final class Ok<T> extends Result<T> {
  const Ok._(this.value);

  final T value;

  @override
  String toString() => 'Result<$T>.ok($value)';
}

final class Error<T> extends Result<T> {
  const Error._(this.error);

  final Exception error;

  @override
  String toString() => 'Result<$T>.error($error)';
}

enum AppExceptionType { accountNotExists, accountExists, general }

final class AppException implements Exception {
  const AppException([this.message, this.type = AppExceptionType.general]);

  final String? message;
  final AppExceptionType type;

  @override
  String toString() => message ?? 'Error found!';
}
