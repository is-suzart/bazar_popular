import 'package:flutter_quill/flutter_quill.dart';
import 'package:mobx/mobx.dart';

part 'upload_product_controller.g.dart';

class UploadProductController = UploadProductControllerStore with _$UploadProductController;

abstract class UploadProductControllerStore with Store {
  @observable
  QuillController controller = QuillController.basic();

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

}