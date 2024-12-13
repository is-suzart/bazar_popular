import 'package:bazar_popular/components/card.dart';
import 'package:bazar_popular/helpers/go.dart';
import 'package:bazar_popular/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class CreateProductShell extends StatelessWidget {
  const CreateProductShell({super.key, required this.child});
  final Widget child;



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
          child: child,
        )
      ).withGridPlacement(columnSpan: 8,columnStart: 2,rowStart: 0)
      

    ],
  ),
  );

}
}

class CreateProductStepOne extends StatelessWidget {
  CreateProductStepOne({super.key});

  final _bazarGo = BazarGo();

  @override
  Widget build(BuildContext context) {
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
        BazarInfoCard(image: "assets/arts/product.png", title: "Produto",onTap: _bazarGo.onTapGo(context, "/divulgar/produto")),
        BazarInfoCard(image: "assets/arts/rifa.png", title: "Rifa",onTap: null,),
        BazarInfoCard(image: "assets/arts/event.png", title: "Evento",onTap: null,),
      ],
      )),
      
        ],
      );
    
    
    
    
  }
}