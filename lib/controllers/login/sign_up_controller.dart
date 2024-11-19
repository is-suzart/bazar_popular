import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';

class  Signupcontroller {
    final form = FormGroup({
    'name': FormControl<String>(validators: [Validators.required]),
    'email': FormControl<String>(validators: [Validators.required, Validators.email]),
    'telephone': FormControl<String>(validators: [Validators.required]),
  });

  final telephoneMaskFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  void onSubmit() {
    if (form.valid) {
      // Processa os dados do formulário
      print(form.value);
    } else {
      // Exibe mensagens de erro ou feedback
      form.markAllAsTouched();
    }
  }
}