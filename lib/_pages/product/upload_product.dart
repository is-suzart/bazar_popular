import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class UploadProduct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UploadState();
}

class UploadState extends State<UploadProduct> {
  final QuillController _controller = QuillController.basic();
  String _p = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: QuillSimpleToolbar(
            controller: _controller,
            configurations: const QuillSimpleToolbarConfigurations(
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
                headerStyleType: HeaderStyleType.buttons),
          ),
        ),
        const Divider(),
        QuillEditor.basic(
          controller: _controller,
          configurations: const QuillEditorConfigurations(),
        ),
        const Divider(),
        ElevatedButton(
            onPressed: () {
              print(_controller.document.toDelta());
              setState(() {
                _p = _controller.document.toPlainText();
              });
            },
            child: Text("veja e verá")),
        Text(_p),
      ],
    );
  }
}
