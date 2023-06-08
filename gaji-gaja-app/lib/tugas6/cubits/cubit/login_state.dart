part of 'login_cubit.dart';

enum AuthStatus { unknown, authenticated, authenticated1, unauthenticated }

class LoginState extends Equatable {
  final AuthStatus status;

  const LoginState._({this.status = AuthStatus.unknown});

  const LoginState.authenticated()
      : this._(
          status: AuthStatus.authenticated,
        );

  const LoginState.authenticated1()
      : this._(
          status: AuthStatus.authenticated1,
        );

  const LoginState.unauthenticated()
      : this._(
          status: AuthStatus.unauthenticated,
        );

  @override
  List<Object?> get props => [status];
}
