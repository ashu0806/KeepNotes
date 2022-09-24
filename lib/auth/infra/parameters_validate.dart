// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:notes_app/auth/application/validator.dart';

import 'package:notes_app/auth/domain/value_failure.dart';
import 'package:notes_app/auth/infra/parameters.dart';

class EmailAddress extends Parameters<String> {
  final Either<ValueFailure<String>, String> email;

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.email);

  @override
  Either<ValueFailure<String>, String> get value => email;
}

class Password extends Parameters<String> {
  final Either<ValueFailure<String>, String> password;

  factory Password(String input) {
    return Password._(
      validPassword(input),
    );
  }

  const Password._(this.password);

  @override
  Either<ValueFailure<String>, String> get value => password;
}
