// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileStore on _ProfileStore, Store {
  late final _$userNameAtom = Atom(
    name: '_ProfileStore.userName',
    context: context,
  );

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$_ProfileStoreActionController = ActionController(
    name: '_ProfileStore',
    context: context,
  );

  @override
  void toggleName() {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
      name: '_ProfileStore.toggleName',
    );
    try {
      return super.toggleName();
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userName: ${userName}
    ''';
  }
}
