import 'package:dart_result/dart_result.dart';
import 'package:test/test.dart';

void main() {
  group('Result', () {

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

    test('isSuccess returns true for Success', () {
      final r = Result<int, String>.success(42);
      expect(r.isSuccess, true);
      expect(r.isFailure, false);
    });

    test('isFailure returns true for Failure', () {
      final r = Result<int, String>.failure('err');
      expect(r.isFailure, true);
      expect(r.isSuccess, false);
    });

    test('getOrNull returns value on Success', () {
      final r = Result<int, String>.success(42);
      expect(r.getOrNull(), 42);
    });

    test('getOrNull returns null on Failure', () {
      final r = Result<int, String>.failure('err');
      expect(r.getOrNull(), null);
    });

    test('errorOrNull returns error on Failure', () {
      final r = Result<int, String>.failure('err');
      expect(r.errorOrNull(), 'err');
    });

    test('errorOrNull returns null on Success', () {
      final r = Result<int, String>.success(42);
      expect(r.errorOrNull(), null);
    });

    test('getOrDefault returns value on Success', () {
      final r = Result<int, String>.success(42);
      expect(r.getOrDefault(0), 42);
    });

    test('getOrDefault returns default on Failure', () {
      final r = Result<int, String>.failure('err');
      expect(r.getOrDefault(0), 0);
    });

  });
}