import 'package:bazar_popular/_controllers/home/home_controller.dart';
import 'package:bazar_popular/shared/components/card.dart';
import 'package:bazar_popular/shared/emitter/emitter_store.dart';
import 'package:bazar_popular/shared/helpers/local.dart';
import 'package:bazar_popular/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

class MyHomePage extends StatelessWidget {
  final _homeController = HomeController();
  final _emitterStore = emitterStore;
  MyHomePage({super.key, required this.title}) {
    _emitterStore.checkIsLogged();
    _homeController.getProducts();
    
  }

  Future<void> shouldRunModal(BuildContext context) async {
    bool? check = await getInstace("rejected_image");

    if (check == null) {

      showDialog(context: context, builder: (_) {
        return SimpleDialog(
          title: Text("Você deseja adicionar uma foto de perfil?",textAlign: TextAlign.center,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: primaryColor)),
          contentPadding:
                  const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
          children: [
            IconButton.filled(onPressed: () => selectImage(context), icon: const Icon(Icons.camera_alt_rounded))

          ],
        );
      });

    }
  }
  selectImage(BuildContext context) async {
          final imagePicker = ImagePicker();
      final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
          if (pickedFile != null) {
        final croppedFile = await _cropImage(pickedFile.path,context);
        
        if (croppedFile != null) {
          _homeController.uploadProfilePicture(croppedFile, _emitterStore.userInfo!.id,context);
          //_emitterStore.updateProfilePicture(croppedFile.path);
        }
      }
  }
  Future<CroppedFile?> _cropImage(String imagePath,BuildContext context) async {
    return await ImageCropper().cropImage(
      sourcePath: imagePath,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
        toolbarTitle: 'Editar Imagem',
        toolbarColor: Colors.blue,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.square,
        lockAspectRatio: true,
      ),
      IOSUiSettings(
        title: 'Editar Imagem',
        minimumAspectRatio: 1.0,
        aspectRatioLockDimensionSwapEnabled: true,
        aspectRatioPickerButtonHidden: true,
        aspectRatioLockEnabled: true,
      ),
      WebUiSettings(
        context: context, // Contexto é necessário para a Web
        size: const CropperSize(
          width: 500,
          height: 500,
        ),
        scalable: true,
        rotatable: false,
        zoomable: true,
        viewwMode: WebViewMode.mode_1,
        translations: const WebTranslations(title: "Cortar Imagem", rotateLeftTooltip: "Rotacionar para a esquerda", rotateRightTooltip: "Rotacionar para a direita", cancelButton: "Cancelar", cropButton: "Cortar")
      ),
      ],

      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 80,
    );
  }

  final String title;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final bool isExtraLargeScreen = Breakpoints.extraLarge.isActive(context);
    final bool isTabletScreen = Breakpoints.mediumAndUp.isActive(context);
    final bool isLargeTablet = Breakpoints.mediumLarge.isActive(context);
    final bool isLargeScreen = Breakpoints.largeAndUp.isActive(context);
    reaction(
          (_) => _emitterStore.isLogged &&
              (_emitterStore.userInfo?.profilePicture == null ||
                  _emitterStore.userInfo?.profilePicture == ""),
          (shouldShowModal) {
            if (shouldShowModal) {
              Future.microtask(() => shouldRunModal(context));
            }
          },
        );
    // Configurando scroll listener para paginação
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 && _homeController.canLoadMore == true) {
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
