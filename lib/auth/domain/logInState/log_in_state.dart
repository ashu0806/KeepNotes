import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_app/auth/domain/authFailure/auth_failure.dart';
part 'log_in_state.freezed.dart';

@freezed
class LogInState with _$LogInState {
  const factory LogInState.initial() = _Initial;
  const factory LogInState.authenticated() = _Authenticated;
  const factory LogInState.unauthenticated() = _Unauthenticated;
  const factory LogInState.failure(
    AuthFailure failure,
  ) = _Failure;
}
