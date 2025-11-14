import '../models/booking.dart';

class BookingService {
  final List<Booking> _history = [];

  List<Booking> get history => List.unmodifiable(_history);

  void addBooking(Booking booking) {
    _history.add(booking);
  }
}
