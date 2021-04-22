// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_detail_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeDetailViewModel on _HomeDetailViewModelBase, Store {
  final _$counterAtom = Atom(name: '_HomeDetailViewModelBase.counter');

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  final _$_HomeDetailViewModelBaseActionController =
      ActionController(name: '_HomeDetailViewModelBase');

  @override
  void increment() {
    final _$actionInfo = _$_HomeDetailViewModelBaseActionController.startAction(
        name: '_HomeDetailViewModelBase.increment');
    try {
      return super.increment();
    } finally {
      _$_HomeDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_HomeDetailViewModelBaseActionController.startAction(
        name: '_HomeDetailViewModelBase.decrement');
    try {
      return super.decrement();
    } finally {
      _$_HomeDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counter: ${counter}
    ''';
  }
}
