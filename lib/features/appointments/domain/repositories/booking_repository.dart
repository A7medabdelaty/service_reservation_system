abstract class BookingRepository {
  Future<List<DateTime>> getAvailableSlots(String doctorId, DateTime date);
  Future<void> bookAppointment(String doctorId, DateTime dateTime);
}
