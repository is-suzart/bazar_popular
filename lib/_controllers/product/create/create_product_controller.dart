

import 'package:bazar_popular/models/product_models.dart';
import 'package:bazar_popular/models/res/reponse_models.dart';
import 'package:bazar_popular/services/product_service.dart';
import 'package:bazar_popular/shared/helpers/go.dart';
import 'package:bazar_popular/shared/helpers/local.dart';
import 'package:bazar_popular/shared/state_dialogs.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:bazar_popular/shared/pipes/currency_mask_pipe.dart';
part 'create_product_controller.g.dart';


class CreateProductController = CreateProductControllerStore with _$CreateProductController;

abstract class CreateProductControllerStore with Store {

  final _bazarGo = BazarGo();
  final logger = Logger();


@observable
FormGroup form = FormGroup({
  'subtitle': FormControl<String>(validators: [Validators.required]),
  'name': FormControl<String>(validators: [Validators.required]),
  'value': FormControl<String>(validators: [Validators.required]),
  'isPromo': FormControl<bool>(value: false),
  'quantidadePromo': FormControl<int>(validators: []),
  'valuePromo': FormControl<String>(validators: []),
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
Future<void> onSubmit (BuildContext context) async {
  final String userId = await getInstace('user_id');
  if (form.valid) {
    final formValues = CreateProductModel(
    userId: userId, 
    subtitle: form.control('subtitle').value, 
    name: form.control('name').value, 
    price: form.control('value').value, 
    isPromo: form.control('isPromo').value,
    promotionalAmount: form.control('quantidadePromo').value, 
    promotionalPrice: form.control('valuePromo').value,
    productType: form.control('type').value, 
    storage: form.control('storage').value,
    place: form.control('place').value
    );
      final CreateProductResult result = await ProductService().createProduct(formValues);
      if(result.isSuccess){
        openInfoDialog(
          context, 
        "Mas ainda falta uma última etapa camarada! vamos terminar de customizar nosso produto revolucionário!", 
        "Produto cadastrado com sucesso!", 
        _bazarGo.onTapGo(context, "/divulgar/${formValues.productType}/finalizar/${result.success!.productId}")
        );
      } else {
        openErrorDialog(context, "Erro ao cadastrar o produto, tente novamente mais tarde!");
        logger.e('Error fetching products: $result');
      }
    } else {
      logger.e('O formulário possui erros.');
      form.markAllAsTouched(); // Marca os campos inválidos
    }
}

}