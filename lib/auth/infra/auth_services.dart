import 'package:dartz/dartz.dart';
import 'package:notes_app/auth/domain/ab_auth_services.dart';
import 'package:notes_app/auth/infra/parameters_validate.dart';
import 'package:notes_app/auth/domain/auth_failure.dart';

class AuthServices extends AbAuthServices {
  @override
  Future<Either<AuthFailure, Unit>> signIn({
    required EmailAddress emailAddress,
    required Password password,
  }) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthFailure, Unit>> signUp({
    required EmailAddress emailAddress,
    required Password password,
  }) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
