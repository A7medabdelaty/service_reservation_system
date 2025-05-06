import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:service_reservation_system/features/appointments/domain/repositories/booking_repository.dart';

class BookingRepositoryImpl implements BookingRepository {
  final FirebaseFirestore _firestore;

  BookingRepositoryImpl(this._firestore);

  @override
  Future<List<DateTime>> getAvailableSlots(
    String doctorId,
    DateTime date,
  ) async {
    final snapshot =
        await _firestore
            .collection('doctors')
            .doc(doctorId)
            .collection('slots')
            .where('date', isEqualTo: date)
            .get();

    return snapshot.docs
        .map((doc) => (doc.data()['time'] as Timestamp).toDate())
        .toList();
  }

  @override
  Future<void> bookAppointment(String doctorId, DateTime dateTime) async {
    await _firestore.collection('appointments').add({
      'doctorId': doctorId,
      'patientId': "// Get from auth service,", // TODO::
      'dateTime': dateTime,
      'status': 'pending',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
