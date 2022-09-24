import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app/auth/domain/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier()
      : super(
          const AuthState.initial(),
        );

        
}
