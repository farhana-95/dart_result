sealed class Result<T, E>{
  const Result();
  factory Result.success(T value) = Success<T, E>;
  factory Result.failure(E error) = Failure<T,E>;

}

final class Success<T, E> extends Result<T, E>{
  final T value;
  const Success(this.value);
}

final class Failure<T,E> extends Result<T,E>{
  final E error;
  const Failure(this.error);
}
