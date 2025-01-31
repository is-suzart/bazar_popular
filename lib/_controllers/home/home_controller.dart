import 'package:bazar_popular/models/product_models.dart';
import 'package:bazar_popular/services/product_service.dart';
import 'package:bazar_popular/services/user_service.dart';
import 'package:bazar_popular/shared/emitter/emitter_store.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerStore with _$HomeController;

abstract class HomeControllerStore with Store {
  final _userService = UserService();
  final int limit = 15; // Quantidade de itens por página
  int offset = 0; // Controle de offset para paginação
  final _productService = ProductService();
  final _emitterStore = emitterStore;

  @observable
  ObservableList<Product> products = ObservableList<Product>();

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingMore = false;

  @observable
  bool canLoadMore = true;

  @action
  Future<void> getProducts() async {
    isLoading = true;
    try {
      final result = await _productService.getProducts(limit, offset);
      if (result != null) {
        products.addAll(result);
      } else{
        products.clear();
      }
    } catch (e) {
      // Trate erros caso necessário
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> loadMoreProducts() async {
    if (isLoadingMore || canLoadMore == false) return; // Evita múltiplas requisições simultâneas

    isLoadingMore = true;
    offset += limit; // Incrementa o offset para buscar a próxima "página"
    try {
      final result = await _productService.getProducts(limit, offset);
      if (result != null) {
        products.addAll(result);
      } else {
        canLoadMore = false;
      }
    } catch (e) {
      offset -= limit; // Reverte o offset em caso de erro
      canLoadMore = false;
    } finally {
      isLoadingMore = false;
    }
  }
  @action
  uploadProfilePicture(CroppedFile? image,String userId,BuildContext context) async {
    if (image == null) return;
    final result = await _userService.updateProfilePicture(image.path, userId);
    if (result != null) {
      _emitterStore.updateUserInfo(userId);
      GoRouter.of(context).pop();

    } 
  }
}
