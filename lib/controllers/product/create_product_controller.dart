

import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:bazar_popular/shared/pipes/currency_mask_pipe.dart';
part 'create_product_controller.g.dart';


class CreateProductController = CreateProductControllerStore with _$CreateProductController;

abstract class CreateProductControllerStore with Store {

@observable
var form = FormGroup({
  'subtitle': FormControl<String>(validators: [Validators.required]),
  'name': FormControl<String>(validators: [Validators.required]),
  'description': FormControl<String>(validators: [Validators.required]),
  'value': FormControl<String>(validators: [Validators.required]),
  'is-promo': FormControl<bool>(value: false),
  'quantidade-promo': FormControl<int>(validators: []),
  'value-promo': FormControl<String>(validators: []),
  'storage': FormControl<int>(validators: [])
});

final currencyMaskFormatter = CurrencyInputFormatter();

@computed
bool get isFormValid => form.valid;

@action
void markFieldsAsTouched() {
  form.markAllAsTouched();
}


}