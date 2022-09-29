import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app/auth/domain/abAuthServices/ab_auth_services.dart';
import 'package:notes_app/auth/domain/signOutState/sign_out_state.dart';

class SignOutNotifier extends StateNotifier<SignOutState> {
  final AbAuthServices service;
  SignOutNotifier(
    super.state,
    this.service,
  );

  Future<void> logOut() async {
    final result = await service.signOut();
    state = result.fold(
      (l) => SignOutState.failure(l),
      (r) => const SignOutState.success(),
    );
  }
}
