import 'package:bazar_popular/components/input.dart';
import 'package:bazar_popular/controllers/product/create_product_controller.dart';
import 'package:bazar_popular/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
//import 'package:reactive_checkbox/reactive_checkbox.dart';
//
class CreateProduct extends StatelessWidget {

  final _createProductController = CreateProductController();
  static const inputPadding = EdgeInsets.symmetric(vertical: 16);
  CreateProduct({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
      padding: const EdgeInsets.symmetric(vertical: 36,horizontal: 48),
      child: Column(
        children: [
          Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            Text("camarada!",style: Theme.of(context).textTheme.headlineSmall),
            Text("Qual o seu fantástico produto?",style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: primaryColor),)
          ],
        ),
      ),
      ReactiveForm(formGroup: _createProductController.form, 
      child: Column(
        children: [
          Container(
            margin: inputPadding,
            child: BazarInput(placeholder: "Subtitulo do produto",formControlName: "subtitle",),
          ),
          Container(
            margin: inputPadding,
            child: BazarInput(placeholder: "Nome do produto",formControlName: "name",),
          ),
          Container(
            margin: inputPadding,
            child: BazarInput(placeholder: "Valor do produto",formControlName: "name",),
          ),
          Container(
            margin: inputPadding,
            child: Row(
              children: [
                ReactiveCheckbox(
              formControlName: 'is-promo',
            ),
            Container(
              margin: const EdgeInsets.only(left: 16),
              child: Text("Tem valor promocional?",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: blackColor),),
            )
              ],
            )
          ),
          if(_createProductController.form.control('is-promo').value == true)
          Container(
            margin: inputPadding,
            child: BazarInput(placeholder: "Quantidade promocional",formControlName: "quantidade-promo",),
          ),
          
          if(_createProductController.form.controls['is-promo']!.value == true)
          Container(
            margin: inputPadding,
            child: BazarInput(placeholder: "Valor Promocional",formControlName: "value-promo",),
          ),
        ],
      ))
        ],
      )
    ),
    );
  }

}