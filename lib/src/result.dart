library;

/// A sealed class representing either a [Success] or a [Failure].
///
/// Use [Result.success] to wrap a successful value and
/// [Result.failure] to wrap an error.
sealed class Result<T, E> {
  const Result();

  /// Creates a successful result holding [value].
  factory Result.success(T value) = Success<T, E>;

  /// Creates a failed result holding [error].
  factory Result.failure(E error) = Failure<T, E>;

  /// Returns true if this is a [Success].
  bool get isSuccess => this is Success<T, E>;

  /// Returns true if this is a [Failure].
  bool get isFailure => this is Failure<T, E>;

  /// Returns the value if [Success], otherwise null.
  T? getOrNull() => switch (this) {
    Success(:final value) => value,
    Failure() => null,
  };

  /// Returns the error if [Failure], otherwise null.
  E? errorOrNull() => switch (this) {
    Success() => null,
    Failure(:final error) => error,
  };

  /// Returns the value if [Success], otherwise returns [defaultValue].
  T getOrDefault(T defaultValue) => switch (this) {
    Success(:final value) => value,
    Failure() => defaultValue,
  };
}

/// Represents a successful [Result] holding a value of type [T].
final class Success<T, E> extends Result<T, E> {
  /// The success value.
  final T value;
  const Success(this.value);
}

/// Represents a failed [Result] holding an error of type [E].
final class Failure<T, E> extends Result<T, E> {
  /// The error value.
  final E error;
  const Failure(this.error);
}