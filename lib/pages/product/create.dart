import 'package:bazar_popular/components/input.dart';
import 'package:bazar_popular/controllers/product/create_product_controller.dart';
import 'package:bazar_popular/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CreateProduct extends StatelessWidget {
  CreateProduct({super.key});

final _createProductController = CreateProductController();



@override
Widget build(BuildContext context) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            Text("Olá camarada!",style: Theme.of(context).textTheme.headlineSmall),
            Text("Vamos criar um novo produto?",style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: primaryColor),)
          ],
        ),
      ),
      Container(
        child: ReactiveForm(
          formGroup: _createProductController.form, 
          child: Column(
            children: [
              BazarInput(placeholder: "nome do produto", formControlName: "name"),
              BazarInput(placeholder: "Descrição do Produto", formControlName: "description")
            ],
          )),
      )

    ],
  );
}
}