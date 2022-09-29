// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:notes_app/auth/domain/valueFailure/value_failure.dart';

class UnexpectedError extends Error {
  final ValueFailure failure;

  UnexpectedError(this.failure);

  @override
  String toString() {
    return Error.safeToString(
      'UnexpectedError(failure: $failure)',
    );
  }
}
