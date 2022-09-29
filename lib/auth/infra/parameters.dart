import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:notes_app/auth/domain/valueFailure/value_failure.dart';
import 'package:notes_app/core/shared/errors.dart';

@immutable
abstract class Parameters<T> {
  const Parameters();

  Either<ValueFailure<T>, T> get value;

  T getOrCrash() {
    return value.fold(
      (l) => throw UnexpectedError(l),
      (r) => r,
    );
  }

  @override
  bool operator ==(covariant Parameters other) {
    if (identical(this, other)) return true;

    return other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value(value: $value)';
}
