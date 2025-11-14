// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BookingStore on _BookingStore, Store {
  late final _$historyAtom = Atom(
    name: '_BookingStore.history',
    context: context,
  );

  @override
  ObservableList<Booking> get history {
    _$historyAtom.reportRead();
    return super.history;
  }

  @override
  set history(ObservableList<Booking> value) {
    _$historyAtom.reportWrite(value, super.history, () {
      super.history = value;
    });
  }

  late final _$_BookingStoreActionController = ActionController(
    name: '_BookingStore',
    context: context,
  );

  @override
  void addBooking(Booking booking) {
    final _$actionInfo = _$_BookingStoreActionController.startAction(
      name: '_BookingStore.addBooking',
    );
    try {
      return super.addBooking(booking);
    } finally {
      _$_BookingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
history: ${history}
    ''';
  }
}
