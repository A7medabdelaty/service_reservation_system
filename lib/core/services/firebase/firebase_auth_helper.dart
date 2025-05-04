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
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw Exception('Failed to create account: $e');
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Handle auth exceptions
  Exception _handleAuthException(dynamic e) {
    if (e is FirebaseAuthException) {
      final errorMessages = {
        'user-not-found': 'No user found for that email.',
        'wrong-password': 'Wrong password provided.',
        'email-already-in-use': 'Email is already in use.',
        'invalid-email': 'The email address is not valid.',
        'weak-password': 'The password provided is too weak.',
        'operation-not-allowed': 'Email/password accounts are not enabled.',
        'user-disabled': 'This user account has been disabled.',
      };
      return Exception(
        errorMessages[e.code] ?? e.message ?? 'Authentication failed.',
      );
    }
    return Exception('Something went wrong.');
  }
}
