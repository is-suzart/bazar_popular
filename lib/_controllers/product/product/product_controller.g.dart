// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductController on ProductControllerStore, Store {
  late final _$productAtom =
      Atom(name: 'ProductControllerStore.product', context: context);

  @override
  Product get product {
    _$productAtom.reportRead();
    return super.product;
  }

  bool _productIsInitialized = false;

  @override
  set product(Product value) {
    _$productAtom
        .reportWrite(value, _productIsInitialized ? super.product : null, () {
      super.product = value;
      _productIsInitialized = true;
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

  late final _$getProductAsyncAction =
      AsyncAction('ProductControllerStore.getProduct', context: context);

  @override
  Future getProduct(String id) {
    return _$getProductAsyncAction.run(() => super.getProduct(id));
  }

  @override
  String toString() {
    return '''
product: ${product},
isLoading: ${isLoading}
    ''';
  }
}
