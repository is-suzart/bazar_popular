// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerStore, Store {
  late final _$productsAtom =
      Atom(name: 'HomeControllerStore.products', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: 'HomeControllerStore.isLoading', context: context);

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

  late final _$isLoadingMoreAtom =
      Atom(name: 'HomeControllerStore.isLoadingMore', context: context);

  @override
  bool get isLoadingMore {
    _$isLoadingMoreAtom.reportRead();
    return super.isLoadingMore;
  }

  @override
  set isLoadingMore(bool value) {
    _$isLoadingMoreAtom.reportWrite(value, super.isLoadingMore, () {
      super.isLoadingMore = value;
    });
  }

  late final _$canLoadMoreAtom =
      Atom(name: 'HomeControllerStore.canLoadMore', context: context);

  @override
  bool get canLoadMore {
    _$canLoadMoreAtom.reportRead();
    return super.canLoadMore;
  }

  @override
  set canLoadMore(bool value) {
    _$canLoadMoreAtom.reportWrite(value, super.canLoadMore, () {
      super.canLoadMore = value;
    });
  }

  late final _$getProductsAsyncAction =
      AsyncAction('HomeControllerStore.getProducts', context: context);

  @override
  Future<void> getProducts() {
    return _$getProductsAsyncAction.run(() => super.getProducts());
  }

  late final _$loadMoreProductsAsyncAction =
      AsyncAction('HomeControllerStore.loadMoreProducts', context: context);

  @override
  Future<void> loadMoreProducts() {
    return _$loadMoreProductsAsyncAction.run(() => super.loadMoreProducts());
  }

  late final _$uploadProfilePictureAsyncAction =
      AsyncAction('HomeControllerStore.uploadProfilePicture', context: context);

  @override
  Future uploadProfilePicture(
      CroppedFile? image, String userId, BuildContext context) {
    return _$uploadProfilePictureAsyncAction
        .run(() => super.uploadProfilePicture(image, userId, context));
  }

  @override
  String toString() {
    return '''
products: ${products},
isLoading: ${isLoading},
isLoadingMore: ${isLoadingMore},
canLoadMore: ${canLoadMore}
    ''';
  }
}
