import 'package:bazar_popular/models/reponse_models.dart';
import 'package:bazar_popular/shared/state_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:mobx/mobx.dart';
import 'package:bazar_popular/services/login_service.dart';
import 'package:bazar_popular/shared/validators/match_password_validator.dart';

part 'sign_up_controller.g.dart';

class SignupController = SignupControllerBase with _$SignupController;

abstract class SignupControllerBase with Store {
  @observable
  int step = 0;

  @observable
  var form = FormGroup({
    'name': FormControl<String>(validators: [Validators.required]),
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email]),
    'telephone': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(validators: [Validators.minLength(8)]),
    'repeat-password':
        FormControl<String>(validators: [Validators.minLength(8)]),
    'state': FormControl<String>(validators: [Validators.required]),
    'city': FormControl<String>(validators: [Validators.required]),
  },validators: [MatchPasswordValidator(controlName: 'password', matchingControlName: 'repeat-password')]);

  final telephoneMaskFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @computed
  bool get isFormValid => form.valid;

  @action
  void nextStep() {
    step++;
  }

  @action
  void previousStep() {
    step--;
  }

  @action
  void markFieldsAsTouched() {
    form.markAllAsTouched();
  }

  @action
  Future<void> onSubmit(BuildContext context) async {
    if (form.valid) {
      final SignResult result = await LoginService().signUp(form.value);

      if (result.isSuccess) {
        GoRouter.of(context).go('/');
      } else if (result.isError) {
        final errorMessage = result.error?.message ?? 'Erro desconhecido';
        openErrorDialog(context, errorMessage);
      } else if (result.isException) {
        openErrorDialog(context, result.exception.toString());
      }
    } else {
      markFieldsAsTouched();
    }
  }
}
