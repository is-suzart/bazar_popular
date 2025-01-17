import 'dart:convert';

import 'package:bazar_popular/models/product_models.dart';
import 'package:bazar_popular/models/res/base_model.dart';
import 'package:bazar_popular/models/res/reponse_models.dart';
import 'package:bazar_popular/services/product_service.dart';
import 'package:bazar_popular/shared/helpers/go.dart';
import 'package:bazar_popular/shared/state_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:mobx/mobx.dart';
import 'package:image_picker/image_picker.dart';


part 'upload_product_controller.g.dart';

class UploadProductController = UploadProductControllerStore with _$UploadProductController;

abstract class UploadProductControllerStore with Store {

  final _bazarGo = BazarGo();

  @observable QuillController controller = QuillController.basic();

  @observable List<XFile> storeImgs = [];
  @observable String chavePixValue = "";
  @observable String chavePix = "cpf";

  List<PixKeyType> tiposChavePix = [
    PixKeyType(label: "Chave pix é tipo celular", value: "celular"),
    PixKeyType(label: "Chave pix é tipo email", value: "email"),
    PixKeyType(label: "Chave pix é tipo CPF", value: "cpf"),
    PixKeyType(label: "Chave pix é de outro tipo", value: "outro")
  ];
  final TextEditingController pixInputController = TextEditingController();

  @computed List<String> get imageNames {
      return storeImgs.map((img) => img.name).toList();
  }

  set setChavePix (String value) => chavePix = value;
  set setChavePixValue (String value) => chavePixValue = value;

  final toolbarConfig = const QuillSimpleToolbarConfigurations(
                showBackgroundColorButton: false,
                showCodeBlock: false,
                showColorButton: false,
                showFontFamily: false,
                showFontSize: false,
                showInlineCode: false,
                showSubscript: false,
                showSuperscript: false,
                showClearFormat: false,
                showSearchButton: false,
                showStrikeThrough: false,
                showIndent: false,
                headerStyleType: HeaderStyleType.buttons,
                );
  
  @action
  Future<void> getPhotos(BuildContext context) async{
      final ImagePicker picker = ImagePicker();
      final List<XFile> response = await picker.pickMultiImage();
      if(response.length > 4 || (response.length + storeImgs.length) > 4) {
        openErrorDialog(context, "Não é permitido mais que 4 imagens");
      } else {
        storeImgs = List.from(storeImgs)..addAll(response);
      } 
  }

  @action
  void removeImageByIndex(int index) {
    storeImgs = List.from(storeImgs)..removeAt(index);
  }

  @action
  Future<void> onSubmit(BuildContext context, String id) async {
    final String deltaJson = jsonEncode(controller.document.toDelta().toJson());
    final form = UploadProductFormModel(id: id,description: deltaJson,pixKey: chavePixValue,pixType: chavePix,pictures: storeImgs);
    final UpdateCreateProductResult result = await ProductService().uploadProduct(form);
    if(result.isSuccess){
      openSuccessDialog(context, "Sucesso ao cadastrar!", "Sucesso!", _bazarGo.onTapGo(context, "/meus-produtos"));
    } else {
      openErrorDialog(context, "Erro ao cadastrar o produto! Tente novamente mais tarde");
    }
  }
}