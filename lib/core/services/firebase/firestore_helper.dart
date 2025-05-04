import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../features/auth/domain/entities/user.dart' as domain;
import '../../error_handling/failure.dart';

class FirestoreHelper {
  final FirebaseFirestore _firestore;
  static FirestoreHelper? _instance;

  FirestoreHelper._({required FirebaseFirestore firestore})
    : _firestore = firestore;

  static FirestoreHelper get instance {
    _instance ??= FirestoreHelper._(firestore: FirebaseFirestore.instance);
    return _instance!;
  }

  // User related operations
  Future<void> createUser(domain.User user) async {
    try {
      await _firestore.collection('users').doc(user.id).set(user.toMap());
    } catch (e) {
      if (e is FirebaseException) {
        throw ServerFailure('Firestore error (${e.code}): ${e.message}');
      }
      throw ServerFailure(
        'Failed to create user in Firestore: ${e.toString()}',
      );
    }
  }

  Future<domain.User?> getUser(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();

      if (!doc.exists) return null;

      return domain.User.fromMap(doc.data()!);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  Future<void> updateUser(domain.User user) async {
    try {
      await _firestore.collection('users').doc(user.id).update(user.toMap());
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
