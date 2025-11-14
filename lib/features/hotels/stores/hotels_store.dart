import 'package:mobx/mobx.dart';
import '../models/hotel.dart';

part 'hotels_store.g.dart';

class HotelsStore = _HotelsStore with _$HotelsStore;

abstract class _HotelsStore with Store {

  @observable
  ObservableList<Hotel> hotels = ObservableList.of([
    Hotel(
      id: '1',
      name: 'Отель Сочи',
      city: 'Сочи',
      imageUrl: 'https://cdn.worldota.net/t/640x400/extranet/17/bf/17bf990ad454e75cf172efcebc4abf9baa4a0afa.jpeg',
      price: 3200,
      description: 'Уютный отель у моря с видом на горы.',
    ),
    Hotel(
      id: '2',
      name: 'Москва Гранд',
      city: 'Москва',
      imageUrl: 'https://cdn.worldota.net/t/640x400/extranet/8f/2b/8f2b893e95e2ed215921ad7c75509d20976d86c5.jpeg',
      price: 4500,
      description: 'Отель в центре столицы рядом с достопримечательностями.',
    ),
    Hotel(
      id: '3',
      name: 'Казань Ривер',
      city: 'Казань',
      imageUrl: 'https://cdn.worldota.net/t/640x400/extranet/media/647c01d693594ffcaecf76a74cc99ff4.jpg',
      price: 2800,
      description: 'Современный отель с панорамным видом на реку.',
    ),
    Hotel(
      id: '4',
      name: 'Невский Палас',
      city: 'Санкт-Петербург',
      imageUrl: 'https://cdn.worldota.net/t/640x400/extranet/c0/dd/c0ddd6d6e0fa1c10811bf5108192ccb223eb11f1.jpeg',
      price: 3900,
      description: 'Отель в историческом центре с видом на Невский проспект.',
    ),
    Hotel(
      id: '5',
      name: 'Алтай Резорт',
      city: 'Горно-Алтайск',
      imageUrl: 'https://cdn.worldota.net/t/640x400/extranet/83/ab/83ab86554d3058caf51bb2087c4bed16828d93a2.jpeg',
      price: 2700,
      description: 'Экологичный отель в окружении гор и природы.',
    ),
  ]);

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
}
