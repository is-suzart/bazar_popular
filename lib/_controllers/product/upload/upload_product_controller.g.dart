// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UploadProductController on UploadProductControllerStore, Store {
  Computed<List<String>>? _$imageNamesComputed;

  @override
  List<String> get imageNames =>
      (_$imageNamesComputed ??= Computed<List<String>>(() => super.imageNames,
              name: 'UploadProductControllerStore.imageNames'))
          .value;

  late final _$controllerAtom =
      Atom(name: 'UploadProductControllerStore.controller', context: context);

  @override
  QuillController get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(QuillController value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  late final _$storeImgsAtom =
      Atom(name: 'UploadProductControllerStore.storeImgs', context: context);

  @override
  List<XFile> get storeImgs {
    _$storeImgsAtom.reportRead();
    return super.storeImgs;
  }

  @override
  set storeImgs(List<XFile> value) {
    _$storeImgsAtom.reportWrite(value, super.storeImgs, () {
      super.storeImgs = value;
    });
  }

  late final _$getPhotosAsyncAction =
      AsyncAction('UploadProductControllerStore.getPhotos', context: context);

  @override
  Future<void> getPhotos(BuildContext context) {
    return _$getPhotosAsyncAction.run(() => super.getPhotos(context));
  }

  @override
  String toString() {
    return '''
controller: ${controller},
storeImgs: ${storeImgs},
imageNames: ${imageNames}
    ''';
  }
}
