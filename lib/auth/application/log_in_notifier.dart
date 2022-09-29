import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app/auth/domain/abAuthServices/ab_auth_services.dart';
import 'package:notes_app/auth/domain/logInState/log_in_state.dart';

class LogInNotifier extends StateNotifier<LogInState> {
  final AbAuthServices service;
  LogInNotifier(
    super.state,
    this.service,
  );

  Future<void> checkSigninUser() async {
    final result = await service.getSignedInUser();
    state = result
        ? const LogInState.authenticated()
        : const LogInState.unauthenticated();
  }
}
