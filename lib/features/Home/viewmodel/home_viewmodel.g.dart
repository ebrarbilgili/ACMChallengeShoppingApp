// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$listAtom = Atom(name: '_HomeViewModelBase.list');

  @override
  List<HomeModel> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<HomeModel> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$getHomeModelDataAsyncAction =
      AsyncAction('_HomeViewModelBase.getHomeModelData');

  @override
  Future<List<HomeModel>> getHomeModelData() {
    return _$getHomeModelDataAsyncAction.run(() => super.getHomeModelData());
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
