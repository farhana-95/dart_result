sealed class ValidationResult<T, E>{
  const ValidationResult();
  factory ValidationResult.success(T value) = Success<T, E>;
  factory ValidationResult.failure(E error) = Failure<T,E>;

}

final class Success<T, E> extends ValidationResult<T, E>{
  final T value;
  const Success(this.value);
}

final class Failure<T,E> extends ValidationResult<T,E>{
  final E error;
  const Failure(this.error);
}
