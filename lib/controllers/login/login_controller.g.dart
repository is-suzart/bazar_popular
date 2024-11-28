// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginControllerStore, Store {
  late final _$showLoginInfoMobileAtom =
      Atom(name: 'LoginControllerStore.showLoginInfoMobile', context: context);

  @override
  bool get showLoginInfoMobile {
    _$showLoginInfoMobileAtom.reportRead();
    return super.showLoginInfoMobile;
  }

  @override
  set showLoginInfoMobile(bool value) {
    _$showLoginInfoMobileAtom.reportWrite(value, super.showLoginInfoMobile, () {
      super.showLoginInfoMobile = value;
    });
  }

  late final _$showInputPasswordContentAtom = Atom(
      name: 'LoginControllerStore.showInputPasswordContent', context: context);

  @override
  bool get showInputPasswordContent {
    _$showInputPasswordContentAtom.reportRead();
    return super.showInputPasswordContent;
  }

  @override
  set showInputPasswordContent(bool value) {
    _$showInputPasswordContentAtom
        .reportWrite(value, super.showInputPasswordContent, () {
      super.showInputPasswordContent = value;
    });
  }

  late final _$performLoginAsyncAction =
      AsyncAction('LoginControllerStore.performLogin', context: context);

  @override
  Future<void> performLogin(dynamic context) {
    return _$performLoginAsyncAction.run(() => super.performLogin(context));
  }

  late final _$LoginControllerStoreActionController =
      ActionController(name: 'LoginControllerStore', context: context);

  @override
  void toggleInputPasswordContentVisibility() {
    final _$actionInfo = _$LoginControllerStoreActionController.startAction(
        name: 'LoginControllerStore.toggleInputPasswordContentVisibility');
    try {
      return super.toggleInputPasswordContentVisibility();
    } finally {
      _$LoginControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleLoginInfo() {
    final _$actionInfo = _$LoginControllerStoreActionController.startAction(
        name: 'LoginControllerStore.toggleLoginInfo');
    try {
      return super.toggleLoginInfo();
    } finally {
      _$LoginControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showLoginInfoMobile: ${showLoginInfoMobile},
showInputPasswordContent: ${showInputPasswordContent}
    ''';
  }
}
