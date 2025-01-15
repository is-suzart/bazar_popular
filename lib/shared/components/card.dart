import 'package:bazar_popular/models/product_models.dart';
import 'package:bazar_popular/shared/helpers/go.dart';
import 'package:bazar_popular/shared/helpers/local.dart';
import 'package:bazar_popular/shared/theme/theme.dart';
import 'package:flutter/material.dart';
class BazarCard extends StatelessWidget {
  BazarCard({super.key, required this.img,required this.info,required this.id});
  final _bazarGo = BazarGo();
  final String img;
  final ProductInfo info;
  final String id;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
            onTap: () => _bazarGo.go(context,'/produto/$id'),
            child: Card(
                child: Column(mainAxisSize: MainAxisSize.max, children: [
              AspectRatio(
                  aspectRatio: 11 / 11,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(setImageUrl(img), fit: BoxFit.cover))),
              Expanded(
                  // Adicione padding ao redor do texto

                  child: Padding(
                      padding:  const EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flex(
                                direction: Axis.vertical,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(info.subtitle,
                                  textAlign: TextAlign.left,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall! // Use headlineSmall para um texto menor
                                          .copyWith(
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold
                                              )),
                                  Text(info.title,
                                  textAlign: TextAlign.left,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall! // Use headlineSmall para um texto menor
                                          .copyWith(color: blackColor))
                                ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if(info.havePromotion)
                                      Text("${info.promotionalAmount.toString()} por ${info.promotionalPrice!} ou",
                                      textAlign: TextAlign.left,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                  color: greyColor)),
                                      Text("R\$ ${info.price}",
                                      textAlign: TextAlign.left,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge!
                                              .copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor,fontSize: 20)),
                                    ],
                                  ),

                                  //Text("fotinha")
                                  const Icon(Icons.person, weight: 200)
                                ])
                          ])))
            ]))));
  }
}

class BazarInfoCard extends StatelessWidget {
  const BazarInfoCard({super.key, this.onTap,required this.image, required this.title});
  final VoidCallback? onTap;
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          //shadowColor: Color(0xFF747474),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Image.asset(image),
                ),
                Text(title,style: Theme.of(context).textTheme.headlineSmall,)
              ],
            ),
          ),
        ),
      ),
    );
  }


}