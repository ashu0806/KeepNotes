import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:notes_app/auth/domain/value_failure.dart';

@immutable
abstract class Parameters<T> {
  const Parameters();

  Either<ValueFailure<T>, T> get value;

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
