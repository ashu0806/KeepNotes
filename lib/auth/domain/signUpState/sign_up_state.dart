import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_app/auth/domain/authFailure/auth_failure.dart';
part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.success() = _Success;
  const factory SignUpState.failure(
    AuthFailure failure,
  ) = _Failure;
}
