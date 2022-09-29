import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_app/auth/domain/authFailure/auth_failure.dart';
part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = _Initial;
  const factory SignInState.success() = _Success;
  const factory SignInState.failure(
    AuthFailure failure,
  ) = _Failure;
}
