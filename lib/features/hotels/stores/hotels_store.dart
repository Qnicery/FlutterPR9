import 'package:mobx/mobx.dart';
import '../models/hotel.dart';

part 'hotels_store.g.dart';

class HotelsStore = _HotelsStore with _$HotelsStore;

abstract class _HotelsStore with Store {

  @observable
  ObservableList<Hotel> hotels = ObservableList<Hotel>();

  @observable
  String? selectedCity;

  @computed
  List<Hotel> get filteredHotels {
    if (selectedCity == null) return hotels.toList();
    return hotels.where((h) => h.city == selectedCity).toList();
  }

  @computed
  List<String> get cities =>
      hotels.map((e) => e.city).toSet().toList();

  @action
  void selectCity(String? city) {
    selectedCity = city;
  }

  @action
  void loadHotels(List<Hotel> list) {
    hotels = ObservableList.of(list);
  }
}
