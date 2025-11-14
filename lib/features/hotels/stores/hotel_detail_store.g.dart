// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HotelDetailStore on _HotelDetailStore, Store {
  Computed<bool>? _$canConfirmComputed;

  @override
  bool get canConfirm => (_$canConfirmComputed ??= Computed<bool>(
    () => super.canConfirm,
    name: '_HotelDetailStore.canConfirm',
  )).value;

  late final _$guestsAtom = Atom(
    name: '_HotelDetailStore.guests',
    context: context,
  );

  @override
  int? get guests {
    _$guestsAtom.reportRead();
    return super.guests;
  }

  @override
  set guests(int? value) {
    _$guestsAtom.reportWrite(value, super.guests, () {
      super.guests = value;
    });
  }

  late final _$dateAtom = Atom(
    name: '_HotelDetailStore.date',
    context: context,
  );

  @override
  DateTime? get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTime? value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  late final _$_HotelDetailStoreActionController = ActionController(
    name: '_HotelDetailStore',
    context: context,
  );

  @override
  void setGuests(String text) {
    final _$actionInfo = _$_HotelDetailStoreActionController.startAction(
      name: '_HotelDetailStore.setGuests',
    );
    try {
      return super.setGuests(text);
    } finally {
      _$_HotelDetailStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(DateTime value) {
    final _$actionInfo = _$_HotelDetailStoreActionController.startAction(
      name: '_HotelDetailStore.setDate',
    );
    try {
      return super.setDate(value);
    } finally {
      _$_HotelDetailStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
guests: ${guests},
date: ${date},
canConfirm: ${canConfirm}
    ''';
  }
}
