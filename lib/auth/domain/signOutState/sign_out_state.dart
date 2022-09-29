import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_app/auth/domain/authFailure/auth_failure.dart';
part 'sign_out_state.freezed.dart';

@freezed
class SignOutState with _$SignOutState {
  const factory SignOutState.initial() = _Initial;
  const factory SignOutState.success() = _Success;
  const factory SignOutState.failure(
    AuthFailure failure,
  ) = _Failure;
}
