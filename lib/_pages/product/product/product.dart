import 'dart:convert';

import 'package:bazar_popular/_controllers/product/product/product_controller.dart';
import 'package:bazar_popular/shared/helpers/local.dart';
import 'package:bazar_popular/shared/theme/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';

class ProductPage extends StatelessWidget {
  final String id;
  final _productController = ProductController();
  ProductPage({super.key, required this.id}) {
    if(_productController.product == null && _productController.user == null) {
      _productController.getProduct(id);
    }
  }
  final CarouselSliderController buttonCarouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (_productController.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 64),
          child: LayoutGrid(
            columnSizes: twelveGrid,
            rowSizes: [1.0.fr],
            columnGap: 64,
            children: [
              Stack(
                alignment:
                    Alignment.center, // Centraliza os filhos no eixo vertical
                children: [
                  CarouselSlider(
                    carouselController: buttonCarouselController,
                    items: _productController.product!.images.map((i) {
                      return Builder(
                        builder: (context) {
                          return AspectRatio(
                            aspectRatio: 9 / 9,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(setImageUrl(i)),
                            ),
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                        aspectRatio: 9 / 9,
                        enableInfiniteScroll: true,
                        autoPlay: false,
                        enlargeCenterPage: true),
                  ),
                  // Botão de avançar (próximo)
                  Positioned(
                    right: 16, // Distância do canto direito
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        buttonCarouselController.nextPage();
                      },
                    ),
                  ),
                  // Botão de recuar (anterior)
                  Positioned(
                    left: 16, // Distância do canto esquerdo
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        buttonCarouselController.previousPage();
                      },
                    ),
                  ),
                ],
              ).withGridPlacement(columnSpan: 5, columnStart: 0, rowStart: 0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _productController.product!.info.subtitle,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: primaryColor),
                    textAlign: TextAlign.left,
                  ),
                  Text(_productController.product!.info.title,
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: TextAlign.left),
                  Text(
                      "${_productController.product!.storage.saled} compraram - ${_productController.product!.storage.total - _productController.product!.storage.saled} restantes",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: greyColor),
                      textAlign: TextAlign.left),
                  SingleChildScrollView(
                    child: QuillEditor.basic(
                      configurations: QuillEditorConfigurations(
                          customStyles: _productController.customStylesQuill,
                          minHeight: 300,
                          maxHeight: MediaQuery.of(context).size.height * 0.65),
                      controller: QuillController(
                          readOnly: true,
                          document: Document.fromDelta(Delta.fromJson(
                              jsonDecode(
                                  _productController.product!.description))),
                          selection: const TextSelection.collapsed(offset: 0)),
                    ),
                  )
                ],
              ).withGridPlacement(columnSpan: 4, columnStart: 5, rowStart: 0),


              Container(
                padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: const Offset(0, 0))
                    ]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vendendor",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: greyColor),
                    ),

                    Row(
                      children: [
                    if(_productController.user!.profilePicture != null && _productController.user!.profilePicture != "")
                    Image.network(setImageUrl(_productController.user!.profilePicture!))
                    else
                    const Icon(Icons.person_rounded,size: 36,),
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      child: Text(_productController.user!.name,style: Theme.of(context).textTheme.headlineSmall!
                    .copyWith(color: greyColor)),
                    )
                      ],
                    ),

                    const SizedBox(height: 100,),
                    Text(_productController.product!.info.price,style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: primaryColor),),
                    if(_productController.product!.info.havePromotion)
                    Text("ou ${_productController.product!.info.promotionalAmount} por ${_productController.product!.info.promotionalPrice}",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: greyColor),),
                    const SizedBox(height: 36,),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ElevatedButton(
                      onPressed: null,
                      style: buttonStyles['primary'],
                      child: const Text("Avançar para compra"),
                    )
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ElevatedButton(
                      onPressed: null,
                      style: buttonStyles['outlined'],
                      child: const Text("Adicionar ao carrinho"),
                    ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: null,
                              child: const Row(
                                children: [
                                  Icon(Icons.favorite_border_outlined),
                                  Text("favoritar")
                                ],
                              )),
                          TextButton(
                              onPressed: null,
                              child: const Row(
                                children: [
                                  Icon(Icons.share),
                                  Text("Compartilhar")
                                ],
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ).withGridPlacement(columnSpan: 3, columnStart: 9, rowStart: 0)
            ],
          ),
        );
      }
    });
  }
}
