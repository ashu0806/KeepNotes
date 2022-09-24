import 'package:dartz/dartz.dart';
import 'package:notes_app/auth/domain/auth_failure.dart';
import 'package:notes_app/auth/infra/parameters_validate.dart';

abstract class AbAuthServices {
  Future<Either<AuthFailure, Unit>> signUp({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signIn({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
