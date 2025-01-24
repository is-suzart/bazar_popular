import 'package:bazar_popular/shared/helpers/local.dart';
import 'package:bazar_popular/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:bazar_popular/_controllers/product/user/user_product_controller.dart';

class UserProduct extends StatelessWidget {
  final _userProductController = UserProductController();

  UserProduct({super.key}) {
    // Carregar produtos no construtor
    _userProductController.getUserProducts();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutGrid(columnSizes: twelveGrid, rowSizes: [1.0.fr],
    children: [
      Observer(
      builder: (_) {
        if (_userProductController.products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 24),
              child:Text("hora de gerenciar",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),textAlign: TextAlign.center,)
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: Text("Meus produtos",style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: primaryColor),textAlign: TextAlign.center,),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _userProductController.products.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    child: ListTile(
                    title: Text(_userProductController.products[index].info.title,style: Theme.of(context).textTheme.bodyMedium,),
                    subtitle: Text(_userProductController.products[index].info.subtitle,style: Theme.of(context).textTheme.bodySmall!.copyWith(color: primaryColor),),
                    leading: Image.network(setImageUrl(_userProductController.products[index].images[0])),
                    trailing: Container(
                      alignment: Alignment.centerRight,
                      width: 100,
                      child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        IconButton(onPressed: () => _userProductController.deleteProduct(
                          _userProductController.products[index].id,context), icon: const Icon(Icons.edit_note_rounded)),
                        IconButton(onPressed: () => _userProductController.deleteProduct(
                          _userProductController.products[index].id,context), icon: const Icon(Icons.delete_rounded)),
                      ],
                    ),
                    ),
                  ),
                  );
                },
              ),
            ),
          ],
        ).withGridPlacement(columnSpan: 8,columnStart: 2,rowStart: 0);
      },
    )
    ],);
  }
}
