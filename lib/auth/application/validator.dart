import 'package:dartz/dartz.dart';
import 'package:notes_app/auth/domain/valueFailure/value_failure.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String email) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  if (RegExp(emailRegex).hasMatch(email)) {
    return right(email);
  } else {
    return left(
      ValueFailure.invalidEmail(email: email),
    );
  }
}

Either<ValueFailure<String>, String> validPassword(String password) {
  if (password.length >= 6) {
    return right(password);
  } else {
    return left(
      ValueFailure.invalidPassword(password: password),
    );
  }
}
