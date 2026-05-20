# dart_result

A lightweight `Result<T, E>` type for elegant error handling in Dart — no try/catch needed.

Inspired by Result types in Rust and Kotlin, built for modern Dart 3 with sealed classes and exhaustive pattern matching.

---

## Features

 ✅ Typed success and failure — no exceptions, no nulls
 ✅ Exhaustive pattern matching with Dart 3 `switch`
 ✅ Works in Flutter, Dart CLI, and backend projects
 ✅ Zero dependencies
 ✅ Fully null-safe

---

## Installation

yaml
```yaml
dependencies:
  dart_result: ^1.0.0
```

bash
```bash
dart pub add dart_result
```

---

## Quick start

```dart
import 'package:dart_result/dart_result.dart';

Result<int, String> divide(int a, int b) {
  if (b == 0) return Result.failure('Cannot divide by zero');
  return Result.success(a ~/ b);
}

void main() {
  final result = divide(10, 2);

  switch (result) {
    case Success(:final value) => print('Result: $value'),
    case Failure(:final error) => print('Error: $error'),
  }
}
```

---

## Usage examples

### Basic success and failure

```dart
Result<String, String> getUsername(int id) {
  if (id <= 0) return Result.failure('Invalid ID');
  return Result.success('farhana_95');
}
```

### Pattern matching

```dart
final result = getUsername(1);

switch (result) {
  case Success(:final value) => print('Welcome, $value'),
  case Failure(:final error) => print('Error: $error'),
}
```

### Type check without pattern matching

```dart
final result = Result<int, String>.success(42);

if (result is Success) {
  print(result.value);
}

if (result is Failure) {
  print(result.error);
}
```

### Using with async / Future

```dart
Future<Result<User, String>> fetchUser(int id) async {
  try {
    final user = await api.getUser(id);
    return Result.success(user);
  } catch (e) {
    return Result.failure('Failed to fetch user: $e');
  }
}

final result = await fetchUser(1);

switch (result) {
  case Success(:final value) => showProfile(value),
  case Failure(:final error) => showError(error),
}
```

### Chaining results

```dart
Result<String, String> validateEmail(String email) {
  if (email.isEmpty) return Result.failure('Email is required');
  if (!email.contains('@')) return Result.failure('Invalid email');
  return Result.success(email);
}

Result<String, String> validatePassword(String password) {
  if (password.length < 8) return Result.failure('Too short');
  return Result.success(password);
}

void submitForm(String email, String password) {
  final emailResult = validateEmail(email);
  final passwordResult = validatePassword(password);

  switch ((emailResult, passwordResult)) {
    case (Success(:final value), Success()):
      print('Form valid, email: $value'),
    case (Failure(:final error), _):
      print('Email error: $error'),
    case (_, Failure(:final error)):
      print('Password error: $error'),
  }
}
```

---

## API reference

### `Result<T, E>`

A sealed class representing either a success or a failure.

```dart
sealed class Result<T, E> {
  factory Result.success(T value) = Success<T, E>;
  factory Result.failure(E error) = Failure<T, E>;
}
```

### `Success<T, E>`

Holds the success value.

```dart
final result = Result<int, String>.success(42);
print((result as Success).value); // 42
```

### `Failure<T, E>`

Holds the error value.

```dart
final result = Result<int, String>.failure('something went wrong');
print((result as Failure).error); // something went wrong
```

---

## Why `Result<T, E>` over try/catch?

| | `try/catch` | `Result<T, E>` |
|---|---|---|
| Error visibility | Hidden | Explicit in return type |
| Exhaustive handling | No | Yes — compiler enforced |
| Composable | Hard | Easy |
| Readable | Verbose | Concise |

---

## Contributing

Pull requests are welcome! Please open an issue first to discuss what you'd like to change.

1. Fork the repository
2. Create your branch: `git checkout -b feature/my-feature`
3. Commit your changes: `git commit -m 'add: my feature'`
4. Push and open a Pull Request

---

## License

MIT © [farhana-95](https://github.com/farhana-95/dart_result)