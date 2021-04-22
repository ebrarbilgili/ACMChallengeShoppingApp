import '../model/home_model.dart';
import '../service/home_service.dart';
import 'package:mobx/mobx.dart';
part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  HomeService homeService;

  _HomeViewModelBase({required this.homeService}) {
    getHomeModelData();
  }

  @observable
  List<HomeModel> list = [];

  @action
  Future<List<HomeModel>> getHomeModelData() async {
    return list = await homeService.getHomeData();
  }
}
