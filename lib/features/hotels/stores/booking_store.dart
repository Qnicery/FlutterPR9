import 'package:mobx/mobx.dart';
import '../models/booking.dart';

part 'booking_store.g.dart';

class BookingStore = _BookingStore with _$BookingStore;

abstract class _BookingStore with Store {

  @observable
  ObservableList<Booking> history = ObservableList<Booking>();

  @action
  void addBooking(Booking booking) {
    history.add(booking);
  }
}
