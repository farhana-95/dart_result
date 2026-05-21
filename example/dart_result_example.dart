import 'package:dart_result/dart_result.dart';

void main() {
  final result = divide(10, 2);

  switch (result) {
    case Success(:final value):
      print('Result: $value');
    case Failure(:final error):
      print('Error: $error');
  }
}

Result<int, String> divide(int a, int b) {
  if (b == 0) return Result.failure('Cannot divide by zero');
  return Result.success(a ~/ b);
}
