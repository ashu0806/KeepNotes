import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app/auth/application/log_in_notifier.dart';
import 'package:notes_app/auth/application/sign_in_notifier.dart';
import 'package:notes_app/auth/application/sign_out_notifier.dart';
import 'package:notes_app/auth/application/sign_up_notifier.dart';
import 'package:notes_app/auth/domain/abAuthServices/ab_auth_services.dart';
import 'package:notes_app/auth/domain/logInState/log_in_state.dart';
import 'package:notes_app/auth/domain/signInState/sign_in_state.dart';
import 'package:notes_app/auth/domain/signOutState/sign_out_state.dart';
import 'package:notes_app/auth/domain/signUpState/sign_up_state.dart';
import 'package:notes_app/auth/infra/auth_services.dart';
import 'package:notes_app/core/shared/providers.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) {
    return FirebaseAuth.instance;
  },
);

final googleSignInProvider = Provider<GoogleSignIn>(
  (ref) {
    return GoogleSignIn();
  },
);

final authServiceProvider = Provider<AbAuthServices>(
  (ref) {
    return AuthServices(
      ref.watch(firebaseAuthProvider),
      ref.watch(googleSignInProvider),
      ref.watch(flutterSecureStorageProvider),
    );
  },
);

final logInNotifierProvider = StateNotifierProvider<LogInNotifier, LogInState>(
  (ref) {
    return LogInNotifier(
      const LogInState.initial(),
      ref.watch(authServiceProvider),
    );
  },
);

final signInNotifierProvider =
    StateNotifierProvider<SignInNotifier, SignInState>(
  (ref) {
    return SignInNotifier(
      const SignInState.initial(),
      ref.watch(authServiceProvider),
    );
  },
);
final signUpNotifierProvider =
    StateNotifierProvider<SignUpNotifier, SignUpState>(
  (ref) {
    return SignUpNotifier(
      const SignUpState.initial(),
      ref.watch(authServiceProvider),
    );
  },
);
final signOutNotifierProvider =
    StateNotifierProvider<SignOutNotifier, SignOutState>(
  (ref) {
    return SignOutNotifier(
      const SignOutState.initial(),
      ref.watch(authServiceProvider),
    );
  },
);
