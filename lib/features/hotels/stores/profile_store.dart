import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  @observable
  String userName = 'User';

  @action
  void toggleName() {
    userName = userName == 'User' ? 'Имя' : 'User';
  }
}
