// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserProductController on UserProductControllerStore, Store {
  late final _$productsAtom =
      Atom(name: 'UserProductControllerStore.products', context: context);

  @override
  ObservableList<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$getUserProductsAsyncAction = AsyncAction(
      'UserProductControllerStore.getUserProducts',
      context: context);

  @override
  Future<dynamic> getUserProducts() {
    return _$getUserProductsAsyncAction.run(() => super.getUserProducts());
  }

  late final _$deleteProductAsyncAction =
      AsyncAction('UserProductControllerStore.deleteProduct', context: context);

  @override
  Future<dynamic> deleteProduct(String productId, BuildContext context) {
    return _$deleteProductAsyncAction
        .run(() => super.deleteProduct(productId, context));
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}
