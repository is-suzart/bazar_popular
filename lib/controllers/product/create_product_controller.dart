

import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';
part 'create_product_controller.g.dart';


class CreateProductController = CreateProductControllerStore with _$CreateProductController;

abstract class CreateProductControllerStore with Store {

@observable
var form = FormGroup({
  'name': FormControl<String>(validators: [Validators.required]),
  'description': FormControl<String>(validators: [Validators.required]),
});

@computed
bool get isFormValid => form.valid;

@action
void markFieldsAsTouched() {
  form.markAllAsTouched();
}


}