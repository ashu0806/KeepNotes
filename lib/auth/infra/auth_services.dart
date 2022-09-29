import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes_app/auth/domain/abAuthServices/ab_auth_services.dart';
import 'package:notes_app/auth/domain/authFailure/auth_failure.dart';
import 'package:notes_app/core/utils/app_constant.dart';

class AuthServices extends AbAuthServices {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final FlutterSecureStorage storage;

  AuthServices(
    this.firebaseAuth,
    this.googleSignIn,
    this.storage,
  );

  @override
  Future<Either<AuthFailure, Unit>> signUp({
    required String emailAddress,
    required String password,
  }) async {
    // final emailString = emailAddress.getOrCrash();
    // final passwordString = password.getOrCrash();
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return right(unit);
    } on PlatformException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(
          const AuthFailure.emailAlreadyInUse(),
        );
      } else {
        return left(
          const AuthFailure.serveError(),
        );
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signIn({
    required String emailAddress,
    required String password,
  }) async {
    // final emailString = emailAddress.getOrCrash();
    // final passwordString = password.getOrCrash();
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return right(unit);
    } on PlatformException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return left(
          const AuthFailure.invalidCombination(),
        );
      } else {
        return left(
          const AuthFailure.serveError(),
        );
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final user = await googleSignIn.signIn();
      if (user == null) {
        return left(
          const AuthFailure.cancelByUser(),
        );
      }
      final googleAuthentication = await user.authentication;
      final authCredentials = GoogleAuthProvider.credential(
        accessToken: googleAuthentication.accessToken,
        idToken: googleAuthentication.idToken,
      );
      await firebaseAuth.signInWithCredential(authCredentials);
      return right(unit);
    } on PlatformException catch (e) {
      log(e.message.toString());
      return left(
        const AuthFailure.serveError(),
      );
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      await firebaseAuth.signOut();
      return right(unit);
    } on FirebaseAuthException {
      return left(
        const AuthFailure.serveError(),
      );
    }
  }

  @override
  Future<bool> getSignedInUser() async => firebaseAuth.currentUser?.uid != null;

  @override
  Future saveUid() async {
    try {
      final result = firebaseAuth.currentUser!.uid;
      await storage.write(
        key: AppConstant.userId,
        value: result,
      );
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<String> getUuid() async {
    final String? uuid = await storage.read(
      key: AppConstant.userId,
    );
    return uuid!;
  }
}
