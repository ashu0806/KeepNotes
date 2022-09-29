import 'package:dartz/dartz.dart';
import 'package:notes_app/auth/domain/authFailure/auth_failure.dart';

abstract class AbAuthServices {
  Future<Either<AuthFailure, Unit>> signUp({
    required String emailAddress,
    required String password,
  });

  Future<Either<AuthFailure, Unit>> signIn({
    required String emailAddress,
    required String password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<Either<AuthFailure, Unit>> signOut();
  Future<bool> getSignedInUser();
  Future saveUid();
  Future<String> getUuid();
}
