// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateProductController on CreateProductControllerStore, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'CreateProductControllerStore.isFormValid'))
          .value;

  late final _$formAtom =
      Atom(name: 'CreateProductControllerStore.form', context: context);

  @override
  FormGroup get form {
    _$formAtom.reportRead();
    return super.form;
  }

  @override
  set form(FormGroup value) {
    _$formAtom.reportWrite(value, super.form, () {
      super.form = value;
    });
  }

  late final _$onSubmitAsyncAction =
      AsyncAction('CreateProductControllerStore.onSubmit', context: context);

  @override
  Future<void> onSubmit(BuildContext context) {
    return _$onSubmitAsyncAction.run(() => super.onSubmit(context));
  }

  late final _$CreateProductControllerStoreActionController =
      ActionController(name: 'CreateProductControllerStore', context: context);

  @override
  void markFieldsAsTouched() {
    final _$actionInfo = _$CreateProductControllerStoreActionController
        .startAction(name: 'CreateProductControllerStore.markFieldsAsTouched');
    try {
      return super.markFieldsAsTouched();
    } finally {
      _$CreateProductControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
form: ${form},
isFormValid: ${isFormValid}
    ''';
  }
}
