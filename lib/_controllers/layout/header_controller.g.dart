// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HeaderController on HeaderControllerStore, Store {
  Computed<bool>? _$isLoggedComputed;

  @override
  bool get isLogged =>
      (_$isLoggedComputed ??= Computed<bool>(() => super.isLogged,
              name: 'HeaderControllerStore.isLogged'))
          .value;

  late final _$userIdAtom =
      Atom(name: 'HeaderControllerStore.userId', context: context);

  @override
  String? get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(String? value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  late final _$checkIsLoggedAsyncAction =
      AsyncAction('HeaderControllerStore.checkIsLogged', context: context);

  @override
  Future checkIsLogged() {
    return _$checkIsLoggedAsyncAction.run(() => super.checkIsLogged());
  }

  late final _$checkIsLoggedWithDelayAsyncAction = AsyncAction(
      'HeaderControllerStore.checkIsLoggedWithDelay',
      context: context);

  @override
  Future checkIsLoggedWithDelay() {
    return _$checkIsLoggedWithDelayAsyncAction
        .run(() => super.checkIsLoggedWithDelay());
  }

  late final _$typeAheadProductsAsyncAction =
      AsyncAction('HeaderControllerStore.typeAheadProducts', context: context);

  @override
  Future typeAheadProducts(String term) {
    return _$typeAheadProductsAsyncAction
        .run(() => super.typeAheadProducts(term));
  }

  late final _$HeaderControllerStoreActionController =
      ActionController(name: 'HeaderControllerStore', context: context);

  @override
  dynamic onSelectedAction(BuildContext context, String item) {
    final _$actionInfo = _$HeaderControllerStoreActionController.startAction(
        name: 'HeaderControllerStore.onSelectedAction');
    try {
      return super.onSelectedAction(context, item);
    } finally {
      _$HeaderControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userId: ${userId},
isLogged: ${isLogged}
    ''';
  }
}
