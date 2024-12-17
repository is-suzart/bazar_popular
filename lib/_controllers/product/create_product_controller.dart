

import 'package:bazar_popular/models/product_models.dart';
import 'package:bazar_popular/services/product_service.dart';
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
  'value': FormControl<String>(validators: [Validators.required]),
  'is-promo': FormControl<bool>(value: false),
  'quantidade-promo': FormControl<int>(validators: []),
  'value-promo': FormControl<String>(validators: []),
  'storage': FormControl<int>(validators: []),
  'place': FormControl<String>(validators: []),
  'type': FormControl<String>(validators: [Validators.required]),
});

late CreateProductFormModel frontForm;

CreateProductFormModel buildForm(String type) {
  switch(type) {
    case 'rifa':
    frontForm = CreateProductFormModel(
      title: "Qual a sua fantástica rifa?", 
      subtitle: "Subtitulo da rifa", 
      name: "Nome da rifa", 
      value: "Valor da rifa", 
      isPromo: "Tem valor promocional?", 
      quantidadePromo: "Quantidade para promoção (ex: 4 números por R\$30)", 
      valuePromo: "Valor Promocional", 
      storage: "Números totais da rifa");
      form.control('type').value = "rifa";
    break;
    case 'produto': 
    frontForm = CreateProductFormModel(
      title: "Qual o seu fantástico produto?", 
      subtitle: "Subtitulo do produto", 
      name: "Nome do produto", 
      value: "Valor do produto", 
      isPromo: "Tem valor promocional?", 
      quantidadePromo: "Quantidade para promoção (ex: 4 produtos por R\$30)", 
      valuePromo: "Valor Promocional", 
      storage: "Quantos itens estão disponíveis no total?");
      form.control('type').value = "produto";
    break;
    case 'evento': 
    frontForm = CreateProductFormModel(
      title: "Qual o seu fantástico evento?", 
      subtitle: "Subtitulo do evento", 
      name: "Nome do evento", 
      value: "Valor do evento (caso seja de graça, apenas coloque R\$ 00,00)", 
      isPromo: "Tem valor promocional?", 
      quantidadePromo: "Quantidade para promoção (ex: 4 ingressos por R\$30)", 
      valuePromo: "Valor Promocional", 
      storage: "Quantos ingressos estão disponíveis no total?",
      place: "Onde vai ser o evento?");
      form.control('type').value = "evento";
    break;
  }
  return frontForm;

}
final currencyMaskFormatter = CurrencyInputFormatter();

@computed
bool get isFormValid => form.valid;

@action
void markFieldsAsTouched() {
  form.markAllAsTouched();
}

@action
void onSubmit () async {
  if (form.valid) {
    //final prefs = await SharedPreferences.getInstance('');
      final finalValues = CreateProductModel.fromJson({
        ...form.value,
        'userId': '12345'
      });
      ProductService().CreateProduct(finalValues);
    } else {
      print('O formulário possui erros.');
      form.markAllAsTouched(); // Marca os campos inválidos
    }
}

}