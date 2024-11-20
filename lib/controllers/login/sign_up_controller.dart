import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:mobx/mobx.dart';

part 'sign_up_controller.g.dart';

class SignupController = _SignupController with _$SignupController;

abstract class _SignupController with Store {
  @observable
  int step = 0;

  @observable
  var form = FormGroup({
    'name': FormControl<String>(validators: [Validators.required]),
    'email': FormControl<String>(validators: [Validators.required, Validators.email]),
    'telephone': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(validators: [Validators.min(8)]),
    'repeat-password': FormControl<String>(validators: [Validators.min(8)]),
    'state': FormControl<String>(validators: []),
    'city': FormControl<String>(validators: []),
  });

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
  void onSubmit() {
    if (form.valid) {
      print(form.value);
    } else {
      markFieldsAsTouched();
    }
  }
}
