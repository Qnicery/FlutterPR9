// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotels_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HotelsStore on _HotelsStore, Store {
  Computed<List<Hotel>>? _$filteredHotelsComputed;

  @override
  List<Hotel> get filteredHotels =>
      (_$filteredHotelsComputed ??= Computed<List<Hotel>>(
        () => super.filteredHotels,
        name: '_HotelsStore.filteredHotels',
      )).value;
  Computed<List<String>>? _$citiesComputed;

  @override
  List<String> get cities => (_$citiesComputed ??= Computed<List<String>>(
    () => super.cities,
    name: '_HotelsStore.cities',
  )).value;

  late final _$hotelsAtom = Atom(name: '_HotelsStore.hotels', context: context);

  @override
  ObservableList<Hotel> get hotels {
    _$hotelsAtom.reportRead();
    return super.hotels;
  }

  @override
  set hotels(ObservableList<Hotel> value) {
    _$hotelsAtom.reportWrite(value, super.hotels, () {
      super.hotels = value;
    });
  }

  late final _$selectedCityAtom = Atom(
    name: '_HotelsStore.selectedCity',
    context: context,
  );

  @override
  String? get selectedCity {
    _$selectedCityAtom.reportRead();
    return super.selectedCity;
  }

  @override
  set selectedCity(String? value) {
    _$selectedCityAtom.reportWrite(value, super.selectedCity, () {
      super.selectedCity = value;
    });
  }

  late final _$_HotelsStoreActionController = ActionController(
    name: '_HotelsStore',
    context: context,
  );

  @override
  void selectCity(String? city) {
    final _$actionInfo = _$_HotelsStoreActionController.startAction(
      name: '_HotelsStore.selectCity',
    );
    try {
      return super.selectCity(city);
    } finally {
      _$_HotelsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hotels: ${hotels},
selectedCity: ${selectedCity},
filteredHotels: ${filteredHotels},
cities: ${cities}
    ''';
  }
}
