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
}

/// Represents a successful [Result] holding a value of type [T].
final class Success<T, E> extends Result<T, E> {
  final T value;
  const Success(this.value);
}

/// Represents a failed [Result] holding an error of type [E].
final class Failure<T, E> extends Result<T, E> {
  final E error;
  const Failure(this.error);
}
