import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error_handling/failure.dart';
import '../../../../core/services/firebase/firebase_auth_helper.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthHelper _authHelper;

  AuthRepositoryImpl({FirebaseAuthHelper? authHelper})
    : _authHelper = authHelper ?? FirebaseAuthHelper.instance;

  @override
  Stream<User?> get authStateChanges => _authHelper.authStateChanges;

  @override
  User? get currentUser => _authHelper.currentUser;

  @override
  Future<Either<Failure, UserCredential>> signInWithEmail(
    String email,
    String password,
  ) async {
    try {
      final result = await _authHelper.signInWithEmail(email, password);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signUpWithEmail(
    String email,
    String password,
  ) async {
    try {
      final result = await _authHelper.signUpWithEmail(email, password);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _authHelper.signOut();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
