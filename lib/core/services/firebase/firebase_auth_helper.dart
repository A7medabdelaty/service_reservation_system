import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  static FirebaseAuthHelper? _instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Private constructor
  FirebaseAuthHelper._();

  // Singleton instance
  static FirebaseAuthHelper get instance {
    _instance ??= FirebaseAuthHelper._();
    return _instance!;
  }

  // Current user
  User? get currentUser => _auth.currentUser;

  // Auth state changes stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign in with email and password
  Future<UserCredential> signInWithEmail(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw _handleAuthException(e);
    }
  }

  // Sign up with email and password
  Future<UserCredential> signUpWithEmail(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw _handleAuthException(e);
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Handle auth exceptions
  Exception _handleAuthException(dynamic e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'user-not-found':
          return Exception('No user found for that email.');
        case 'wrong-password':
          return Exception('Wrong password provided.');
        case 'email-already-in-use':
          return Exception('Email is already in use.');
        default:
          return Exception(e.message ?? 'Authentication failed.');
      }
    }
    return Exception('Something went wrong.');
  }
}
