import 'package:bazar_popular/components/card.dart';
import 'package:bazar_popular/components/input.dart';
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
    margin: const EdgeInsets.only(top: 36,bottom: 36),
    child: LayoutGrid(
    columnSizes: twelveGrid, 
    rowSizes: [1.0.fr],
    rowGap: 24,
    children: [
      Card(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 48),
          child: CreateProductStepOne(),
        )
      ).withGridPlacement(columnSpan: 8,columnStart: 2,rowStart: 0)
      

    ],
  ),
  );

}
}

class CreateProductStepOne extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        children: [
          Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            Text("Olá camarada!",style: Theme.of(context).textTheme.headlineSmall),
            Text("O que vamos divulgar hoje?",style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: primaryColor),)
          ],
        ),
      ),
      Expanded(
        child: LayoutGrid(
      columnSizes: [1.0.fr,1.0.fr,1.0.fr], 
      rowSizes: [1.0.fr],
      children: [
        BazarInfoCard(image: "assets/arts/product.png", title: "Produto",onTap: null,),
        BazarInfoCard(image: "assets/arts/rifa.png", title: "Rifa",onTap: null,),
        BazarInfoCard(image: "assets/arts/event.png", title: "Evento",onTap: null,),
      ],
      )),
      
        ],
      );
    
    
    
    
  }
}