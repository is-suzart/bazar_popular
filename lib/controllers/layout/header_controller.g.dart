// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HeaderController on HeaderControllerStore, Store {
  late final _$selectedUserActionAtom =
      Atom(name: 'HeaderControllerStore.selectedUserAction', context: context);

  @override
  String get selectedUserAction {
    _$selectedUserActionAtom.reportRead();
    return super.selectedUserAction;
  }

  @override
  set selectedUserAction(String value) {
    _$selectedUserActionAtom.reportWrite(value, super.selectedUserAction, () {
      super.selectedUserAction = value;
    });
  }

  late final _$selectProductActionAtom =
      Atom(name: 'HeaderControllerStore.selectProductAction', context: context);

  @override
  String get selectProductAction {
    _$selectProductActionAtom.reportRead();
    return super.selectProductAction;
  }

  @override
  set selectProductAction(String value) {
    _$selectProductActionAtom.reportWrite(value, super.selectProductAction, () {
      super.selectProductAction = value;
    });
  }

  late final _$HeaderControllerStoreActionController =
      ActionController(name: 'HeaderControllerStore', context: context);

  @override
  dynamic onSelectedUserAction(BuildContext context, String item) {
    final _$actionInfo = _$HeaderControllerStoreActionController.startAction(
        name: 'HeaderControllerStore.onSelectedUserAction');
    try {
      return super.onSelectedUserAction(context, item);
    } finally {
      _$HeaderControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSelectedProductAction(BuildContext context, String item) {
    final _$actionInfo = _$HeaderControllerStoreActionController.startAction(
        name: 'HeaderControllerStore.onSelectedProductAction');
    try {
      return super.onSelectedProductAction(context, item);
    } finally {
      _$HeaderControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedUserAction: ${selectedUserAction},
selectProductAction: ${selectProductAction}
    ''';
  }
}
