import 'package:bazar_popular/components/input.dart';
import 'package:bazar_popular/components/textarea.dart';
import 'package:bazar_popular/controllers/product/create_product_controller.dart';
import 'package:bazar_popular/shared/pipes/currency_mask_pipe.dart';
import 'package:bazar_popular/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CreateProduct extends StatelessWidget {
  CreateProduct({super.key});

final _createProductController = CreateProductController();



@override
Widget build(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 36,bottom: 36),
    child: LayoutGrid(
    columnSizes: twelveGrid, 
    rowSizes: [1.0.fr],
    rowGap: 24,
    children: [
      Card(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 48),
          child: Column(
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: BazarInput(placeholder: "nome do produto", formControlName: "name"),
              ),
              // Container(
              //   margin: const EdgeInsets.symmetric(vertical: 16),
              //   child: BazarInput(placeholder: "Descrição do Produto", formControlName: "description"),
              // ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: BazarInput(placeholder: "Valor do produto", formControlName: "value",inputFormatter: CurrencyInputFormatter(),),
              ),
              // Container(
              //   margin: const EdgeInsets.symmetric(vertical: 16),
              //   child: BazarTextarea(formControlName: "description", placeholder: "Descrição do Produto"),
              // )
            ],
          )),
      )
        ],
      ),
        )
      ).withGridPlacement(columnSpan: 8,columnStart: 2,rowStart: 0)
      

    ],
  ),
  );

}
}
