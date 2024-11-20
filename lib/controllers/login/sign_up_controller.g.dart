// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupController on _SignupController, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignupController.isFormValid'))
          .value;

  late final _$stepAtom =
      Atom(name: '_SignupController.step', context: context);

  @override
  int get step {
    _$stepAtom.reportRead();
    return super.step;
  }

  @override
  set step(int value) {
    _$stepAtom.reportWrite(value, super.step, () {
      super.step = value;
    });
  }

  late final _$formAtom =
      Atom(name: '_SignupController.form', context: context);

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

  late final _$_SignupControllerActionController =
      ActionController(name: '_SignupController', context: context);

  @override
  void nextStep() {
    final _$actionInfo = _$_SignupControllerActionController.startAction(
        name: '_SignupController.nextStep');
    try {
      return super.nextStep();
    } finally {
      _$_SignupControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void previousStep() {
    final _$actionInfo = _$_SignupControllerActionController.startAction(
        name: '_SignupController.previousStep');
    try {
      return super.previousStep();
    } finally {
      _$_SignupControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markFieldsAsTouched() {
    final _$actionInfo = _$_SignupControllerActionController.startAction(
        name: '_SignupController.markFieldsAsTouched');
    try {
      return super.markFieldsAsTouched();
    } finally {
      _$_SignupControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSubmit() {
    final _$actionInfo = _$_SignupControllerActionController.startAction(
        name: '_SignupController.onSubmit');
    try {
      return super.onSubmit();
    } finally {
      _$_SignupControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
step: ${step},
form: ${form},
isFormValid: ${isFormValid}
    ''';
  }
}
