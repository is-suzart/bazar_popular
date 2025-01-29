// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emitter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmitterStore on EventEmitterStore, Store {
  Computed<bool>? _$isLoggedComputed;

  @override
  bool get isLogged =>
      (_$isLoggedComputed ??= Computed<bool>(() => super.isLogged,
              name: 'EventEmitterStore.isLogged'))
          .value;

  late final _$eventDataAtom =
      Atom(name: 'EventEmitterStore.eventData', context: context);

  @override
  String get eventData {
    _$eventDataAtom.reportRead();
    return super.eventData;
  }

  @override
  set eventData(String value) {
    _$eventDataAtom.reportWrite(value, super.eventData, () {
      super.eventData = value;
    });
  }

  late final _$loggedUserIdAtom =
      Atom(name: 'EventEmitterStore.loggedUserId', context: context);

  @override
  String? get loggedUserId {
    _$loggedUserIdAtom.reportRead();
    return super.loggedUserId;
  }

  @override
  set loggedUserId(String? value) {
    _$loggedUserIdAtom.reportWrite(value, super.loggedUserId, () {
      super.loggedUserId = value;
    });
  }

  late final _$checkIsLoggedAsyncAction =
      AsyncAction('EventEmitterStore.checkIsLogged', context: context);

  @override
  Future checkIsLogged() {
    return _$checkIsLoggedAsyncAction.run(() => super.checkIsLogged());
  }

  late final _$EventEmitterStoreActionController =
      ActionController(name: 'EventEmitterStore', context: context);

  @override
  void setEventData(String data) {
    final _$actionInfo = _$EventEmitterStoreActionController.startAction(
        name: 'EventEmitterStore.setEventData');
    try {
      return super.setEventData(data);
    } finally {
      _$EventEmitterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
eventData: ${eventData},
loggedUserId: ${loggedUserId},
isLogged: ${isLogged}
    ''';
  }
}
