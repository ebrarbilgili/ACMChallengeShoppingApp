import 'package:mobx/mobx.dart';

part 'home_detail_viewmodel.g.dart';

class HomeDetailViewModel = _HomeDetailViewModelBase with _$HomeDetailViewModel;

abstract class _HomeDetailViewModelBase with Store {
  @observable
  int counter = 1;

  @action
  void increment() {
    counter++;
  }

  @action
  void decrement() {
    if (counter < 1) return;
    counter--;
  }
}
