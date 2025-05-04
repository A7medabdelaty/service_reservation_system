import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription<User?>? _authStateSubscription;

  AuthBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(AuthInitial()) {
    on<AuthCheckStatusEvent>(_onAuthCheckStatus);
    on<AuthSignInWithEmailEvent>(_onSignInWithEmail);
    on<AuthSignUpWithEmailEvent>(_onSignUpWithEmail);
    on<AuthSignOutEvent>(_onSignOut);
    on<AuthErrorEvent>(_onAuthError); // Add error event handler

    _setupAuthStateSubscription();
  }

  Future<void> _onAuthError(
    AuthErrorEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthFailure(event.message));
  }

  void _setupAuthStateSubscription() {
    _authStateSubscription = _authRepository.authStateChanges.listen(
      (user) {
        if (user != null) {
          add(AuthCheckStatusEvent());
        } else {
          add(AuthCheckStatusEvent()); // Also handle null user case
        }
      },
      onError: (error) {
        add(AuthErrorEvent(error.toString())); // Add error handling
      },
    );
  }

  Future<void> _onAuthCheckStatus(
    AuthCheckStatusEvent event,
    Emitter<AuthState> emit,
  ) async {
    final user = _authRepository.currentUser;
    if (user != null) {
      emit(AuthAuthenticated(user));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onSignInWithEmail(
    AuthSignInWithEmailEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _authRepository.signInWithEmail(
      event.email,
      event.password,
    );

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (userCredential) => emit(AuthAuthenticated(userCredential.user!)),
    );
  }

  Future<void> _onSignUpWithEmail(
    AuthSignUpWithEmailEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _authRepository.signUpWithEmail(
      event.email,
      event.password,
      event.name,
      event.phone,
    );

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (userCredential) => emit(AuthAuthenticated(userCredential.user!)),
    );
  }

  Future<void> _onSignOut(
    AuthSignOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _authRepository.signOut();

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (_) => emit(AuthUnauthenticated()),
    );
  }

  @override
  Future<void> close() {
    _authStateSubscription?.cancel();
    return super.close();
  }
}
