import 'package:bazar_popular/_controllers/home/home_controller.dart';
import 'package:bazar_popular/shared/components/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MyHomePage extends StatelessWidget {
  final _homeController = HomeController();

  MyHomePage({super.key, required this.title}) {
    _homeController.getProducts();
  }

  final String title;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final bool isExtraLargeScreen = Breakpoints.extraLarge.isActive(context);
    final bool isTabletScreen = Breakpoints.mediumAndUp.isActive(context);
    final bool isLargeTablet = Breakpoints.mediumLarge.isActive(context);
    final bool isLargeScreen = Breakpoints.largeAndUp.isActive(context);

    // Configurando scroll listener para paginação
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
        _homeController.loadMoreProducts(); // Carrega mais produtos quando o usuário está próximo do final
      }
    });

    return AdaptiveLayout(
      body: SlotLayout(
        config: {
          Breakpoints.smallAndUp: SlotLayout.from(
            key: const Key("home-body"),
            builder: (context) {
              return Container(
                padding: isLargeScreen
                    ? const EdgeInsets.fromLTRB(64, 32, 64, 24)
                    : const EdgeInsets.fromLTRB(16, 32, 16, 24),
                child: Observer(builder: (_) {
                  // Se estiver carregando, mostra o indicador
                  if (_homeController.isLoading && _homeController.products.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // Se a lista estiver vazia e não está carregando, exibe mensagem
                  if (_homeController.products.isEmpty) {
                    return const Center(child: Text('Nenhum produto encontrado.'));
                  }

                  // Exibe os produtos em um GridView
                  return Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          controller: _scrollController,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: isLargeScreen ? 4 : isLargeTablet ? 3 : 2,
                            childAspectRatio: isExtraLargeScreen
                                ? 9 / 12
                                : isLargeScreen
                                    ? 8.3 / 12
                                    : isLargeTablet
                                        ? 8.1 / 12
                                        : !isTabletScreen
                                            ? 7 / 12
                                            : 7.0 / 12,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                          ),
                          itemCount: _homeController.products.length,
                          itemBuilder: (ctx, index) {
                            final product = _homeController.products[index];
                            return BazarCard(
                              img: product.images[0],
                              info: product.info,
                              id: product.id
                            );
                          },
                        ),
                      ),
                      if (_homeController.isLoadingMore)
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(),
                        ),
                    ],
                  );
                }),
              );
            },
          ),
        },
      ),
    );
  }
}
