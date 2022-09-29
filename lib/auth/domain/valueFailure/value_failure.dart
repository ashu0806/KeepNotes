import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failure.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const ValueFailure._();
  const factory ValueFailure.invalidEmail({
    required String email,
  }) = _InvalidEmail<T>;
  const factory ValueFailure.invalidPassword({
    required String password,
  }) = InvalidPassword<T>;
}
