// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupController on SignupControllerBase, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'SignupControllerBase.isFormValid'))
          .value;

  late final _$stepAtom =
      Atom(name: 'SignupControllerBase.step', context: context);

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
      Atom(name: 'SignupControllerBase.form', context: context);

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
      AsyncAction('SignupControllerBase.onSubmit', context: context);

  @override
  Future<void> onSubmit(BuildContext context) {
    return _$onSubmitAsyncAction.run(() => super.onSubmit(context));
  }

  late final _$SignupControllerBaseActionController =
      ActionController(name: 'SignupControllerBase', context: context);

  @override
  void nextStep() {
    final _$actionInfo = _$SignupControllerBaseActionController.startAction(
        name: 'SignupControllerBase.nextStep');
    try {
      return super.nextStep();
    } finally {
      _$SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void previousStep() {
    final _$actionInfo = _$SignupControllerBaseActionController.startAction(
        name: 'SignupControllerBase.previousStep');
    try {
      return super.previousStep();
    } finally {
      _$SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markFieldsAsTouched() {
    final _$actionInfo = _$SignupControllerBaseActionController.startAction(
        name: 'SignupControllerBase.markFieldsAsTouched');
    try {
      return super.markFieldsAsTouched();
    } finally {
      _$SignupControllerBaseActionController.endAction(_$actionInfo);
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
