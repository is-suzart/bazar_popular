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

        QuillSimpleToolbar(
  controller: _controller,
  configurations: const QuillSimpleToolbarConfigurations(),
),
const Divider(),
  QuillEditor.basic(
    controller: _controller,
    configurations: const QuillEditorConfigurations(),
  ),
const Divider(),
ElevatedButton(onPressed: () {
  print(_controller.document.toDelta());
  setState(() {
    _p = _controller.document.toPlainText();
  });
}, child: Text("veja e verá")),
Text(_p),
      ],
    );
  }
}