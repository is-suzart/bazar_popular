// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesController on FavoritesControllerStore, Store {
  late final _$productsAtom =
      Atom(name: 'FavoritesControllerStore.products', context: context);

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

  late final _$getUserFavoritesAsyncAction = AsyncAction(
      'FavoritesControllerStore.getUserFavorites',
      context: context);

  @override
  Future getUserFavorites() {
    return _$getUserFavoritesAsyncAction.run(() => super.getUserFavorites());
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}
