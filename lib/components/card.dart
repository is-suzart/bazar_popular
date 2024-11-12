import 'package:bazar_popular/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class BazarCard extends StatefulWidget {
  const BazarCard({super.key, required this.img});

  final String img;
  @override
  State<BazarCard> createState() => BazarCardState();
}

class BazarCardState extends State<BazarCard> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
            onTap: () => {},
            child: Card(
                child: Column(mainAxisSize: MainAxisSize.max, children: [
              AspectRatio(
                  aspectRatio: 11 / 11,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(widget.img, fit: BoxFit.cover))),
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
                                  Text("Rifa Solidária do MLC",
                                  textAlign: TextAlign.left,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall! // Use headlineSmall para um texto menor
                                          .copyWith(
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold
                                              )),
                                  Text("Videogame portátil",
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
                                      Text("R\$ 4 por 30,00 ou",
                                      textAlign: TextAlign.left,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                  color: greyColor)),
                                      Text("R\$ 10,00",
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
