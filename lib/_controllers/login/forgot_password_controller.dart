import 'package:reactive_forms/reactive_forms.dart';

class Forgotpasswordcontroller {
    final form = FormGroup({
    'recovery-email': FormControl<String>(validators: [Validators.required,Validators.email])
  });
}