// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductController on ProductControllerStore, Store {
  Computed<ButtonStyle>? _$favoriteButtonStyleComputed;

  @override
  ButtonStyle get favoriteButtonStyle => (_$favoriteButtonStyleComputed ??=
          Computed<ButtonStyle>(() => super.favoriteButtonStyle,
              name: 'ProductControllerStore.favoriteButtonStyle'))
      .value;

  late final _$productAtom =
      Atom(name: 'ProductControllerStore.product', context: context);

  @override
  Product? get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(Product? value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  late final _$userAtom =
      Atom(name: 'ProductControllerStore.user', context: context);

  @override
  UserModels? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModels? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'ProductControllerStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$loggedUserAtom =
      Atom(name: 'ProductControllerStore.loggedUser', context: context);

  @override
  String? get loggedUser {
    _$loggedUserAtom.reportRead();
    return super.loggedUser;
  }

  @override
  set loggedUser(String? value) {
    _$loggedUserAtom.reportWrite(value, super.loggedUser, () {
      super.loggedUser = value;
    });
  }

  late final _$isFavoriteAtom =
      Atom(name: 'ProductControllerStore.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$getProductAsyncAction =
      AsyncAction('ProductControllerStore.getProduct', context: context);

  @override
  Future<void> getProduct(String id) {
    return _$getProductAsyncAction.run(() => super.getProduct(id));
  }

  late final _$setFavoriteProductAsyncAction = AsyncAction(
      'ProductControllerStore.setFavoriteProduct',
      context: context);

  @override
  Future<void> setFavoriteProduct(String productId, String userId) {
    return _$setFavoriteProductAsyncAction
        .run(() => super.setFavoriteProduct(productId, userId));
  }

  late final _$getFavoriteProductAsyncAction = AsyncAction(
      'ProductControllerStore.getFavoriteProduct',
      context: context);

  @override
  Future<void> getFavoriteProduct(String productId, String userId) {
    return _$getFavoriteProductAsyncAction
        .run(() => super.getFavoriteProduct(productId, userId));
  }

  @override
  String toString() {
    return '''
product: ${product},
user: ${user},
isLoading: ${isLoading},
loggedUser: ${loggedUser},
isFavorite: ${isFavorite},
favoriteButtonStyle: ${favoriteButtonStyle}
    ''';
  }
}
