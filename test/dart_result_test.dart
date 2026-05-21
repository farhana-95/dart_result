import 'package:dart_result/dart_result.dart';
import 'package:test/test.dart';

void main() {
  group('Result', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Success holds a value', () {
      final r = Result<int, String>.success(42);
      expect((r as Success).value, 42);
    });

    test('Failure holds an error', () {
      final r = Result<int, String>.failure('Oops! error');
      expect((r as Failure).error, 'Oops! error');
    });

    test('pattern match works', () {
      Result<int, String> r = Result.success(1);
      final msg = switch (r) {
        Success(:final value) => 'Got $value',
        Failure(:final error) => 'Error: $error',
      };
      expect(msg, 'Got 1');
    });

    test('success is not failure', () {
      final r = Result<int, String>.success(42);
      expect(r, isA<Success>());
      expect(r, isNot(isA<Failure>()));
    });

    test('failure is not success', () {
      final r = Result<int, String>.failure('err');
      expect(r, isA<Failure>());
      expect(r, isNot(isA<Success>()));
    });
  });
}
