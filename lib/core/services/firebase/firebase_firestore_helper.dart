import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreHelper {
  static FirebaseFirestoreHelper? _instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Private constructor
  FirebaseFirestoreHelper._();

  // Singleton instance
  static FirebaseFirestoreHelper get instance {
    _instance ??= FirebaseFirestoreHelper._();
    return _instance!;
  }

  // Get collection reference
  CollectionReference collection(String path) {
    return _firestore.collection(path);
  }

  // Get document reference
  DocumentReference document(String path) {
    return _firestore.doc(path);
  }

  // Add document to collection
  Future<DocumentReference> addDocument(
    String collection,
    Map<String, dynamic> data,
  ) async {
    return await _firestore.collection(collection).add(data);
  }

  // Get document by ID
  Future<DocumentSnapshot> getDocument(
    String collection,
    String documentId,
  ) async {
    return await _firestore.collection(collection).doc(documentId).get();
  }

  // Update document
  Future<void> updateDocument(
    String collection,
    String documentId,
    Map<String, dynamic> data,
  ) async {
    await _firestore.collection(collection).doc(documentId).update(data);
  }

  // Delete document
  Future<void> deleteDocument(String collection, String documentId) async {
    await _firestore.collection(collection).doc(documentId).delete();
  }

  // Get collection stream
  Stream<QuerySnapshot> getCollectionStream(String collection) {
    return _firestore.collection(collection).snapshots();
  }

  // Get document stream
  Stream<DocumentSnapshot> getDocumentStream(
    String collection,
    String documentId,
  ) {
    return _firestore.collection(collection).doc(documentId).snapshots();
  }
}
