import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app/auth/domain/abAuthServices/ab_auth_services.dart';
import 'package:notes_app/auth/domain/signInState/sign_in_state.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  final AbAuthServices service;

  SignInNotifier(
    super.state,
    this.service,
  );

  Future<void> signIn(
    String email,
    String pass,
  ) async {
    final data = await service.signIn(
      emailAddress: email,
      password: pass,
    );
    state = data.fold(
      (l) => SignInState.failure(l),
      (r) => const SignInState.success(),
    );
  }

  Future<void> googleSignIn() async {
    final data = await service.signInWithGoogle();
    state = data.fold(
      (l) => SignInState.failure(l),
      (r) => const SignInState.success(),
    );
  }
}
