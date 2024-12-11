

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';
part 'create_product_controller.g.dart';


class CreateProductController = CreateProductControllerStore with _$CreateProductController;

abstract class CreateProductControllerStore with Store {

@observable
var form = FormGroup({
  'name': FormControl<String>(validators: [Validators.required]),
  'description': FormControl<String>(validators: [Validators.required]),
  'value': FormControl<String>(validators: [Validators.required])
});

@computed
final currencyMaskFormatter = MaskTextInputFormatter(
  initialText: '0,00',
  mask: 'R\$ ###.###.###,##',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);

@computed
bool get isFormValid => form.valid;

@action
void markFieldsAsTouched() {
  form.markAllAsTouched();
}


}