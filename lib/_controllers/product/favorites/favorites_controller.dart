import 'package:bazar_popular/models/product_models.dart';
import 'package:bazar_popular/services/product_service.dart';
import 'package:bazar_popular/shared/helpers/local.dart';
import 'package:mobx/mobx.dart';

part 'favorites_controller.g.dart';

class FavoritesController = FavoritesControllerStore with _$FavoritesController;

abstract class FavoritesControllerStore with Store {
  final _productService = ProductService();
  @observable
  ObservableList<Product> products = ObservableList<Product>();

  @action
  getUserFavorites() async {
    final userId = await getInstace("user_id");
    final result = await _productService.getUserFavorites(userId);
    if (result != null) {
      products.addAll(result);
    } else if (result == null) {
      products.clear();
    }
  }
}