abstract class AuthEvent {}

class AuthSignInWithEmailEvent extends AuthEvent {
  final String email;
  final String password;

  AuthSignInWithEmailEvent({required this.email, required this.password});
}

class AuthSignUpWithEmailEvent extends AuthEvent {
  final String email;
  final String password;

  AuthSignUpWithEmailEvent({required this.email, required this.password});
}

class AuthSignOutEvent extends AuthEvent {}

class AuthCheckStatusEvent extends AuthEvent {}
