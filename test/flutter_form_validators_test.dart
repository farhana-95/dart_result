import 'package:flutter_form_validators/flutter_form_validators.dart';
import 'package:test/test.dart';

void main() {
  group('ValidationResult', () {

    setUp(() {
      // Additional setup goes here.
    });

    test('Success holds a value', () {
      final r = ValidationResult<int, String>.success(42);
      expect((r as Success).value,42);
    });

    test('Failure holds an error', () {
      final r = ValidationResult<int, String>.failure('Oops! error');
      expect((r as Failure).error,'Oops! error');
    });

    test('pattern match works', () {
      ValidationResult<int, String> r = ValidationResult.success(1);
      final msg = switch (r) {
        Success(:final value) => 'Got $value',
        Failure(:final error) => 'Error: $error',
      };
      expect(msg, 'Got 1');
    });

   test('success is not failure', () {
      final r = ValidationResult<int, String>.success(42);
      expect(r, isA<Success>());
      expect(r, isNot(isA<Failure>()));
    });

    test('failure is not success', () {
      final r = ValidationResult<int, String>.failure('err');
      expect(r, isA<Failure>());
      expect(r, isNot(isA<Success>()));
    });

  });
}
