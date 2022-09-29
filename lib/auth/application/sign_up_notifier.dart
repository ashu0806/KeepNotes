import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app/auth/domain/abAuthServices/ab_auth_services.dart';
import 'package:notes_app/auth/domain/signUpState/sign_up_state.dart';

class SignUpNotifier extends StateNotifier<SignUpState> {
  final AbAuthServices service;

  SignUpNotifier(
    super.state,
    this.service,
  );

  Future<void> signUp(
    String email,
    String pass,
  ) async {
    final data = await service.signUp(
      emailAddress: email,
      password: pass,
    );
    state = data.fold(
      (l) => SignUpState.failure(l),
      (r) => const SignUpState.success(),
    );
  }
}
