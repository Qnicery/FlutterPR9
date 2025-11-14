import 'package:mobx/mobx.dart';

part 'hotel_detail_store.g.dart';

class HotelDetailStore = _HotelDetailStore with _$HotelDetailStore;

abstract class _HotelDetailStore with Store {
  @observable
  int? guests;

  @observable
  DateTime? date;

  @computed
  bool get canConfirm => guests != null && guests! > 0 && date != null;

  @action
  void setGuests(String text) {
    guests = int.tryParse(text);
  }

  @action
  void setDate(DateTime value) {
    date = value;
  }
}
