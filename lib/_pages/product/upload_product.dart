import 'package:bazar_popular/_controllers/product/upload/upload_product_controller.dart';
import 'package:bazar_popular/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class UploadProduct extends StatelessWidget {
  UploadProduct({super.key});

  final _uploadController = UploadProductController();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              Text("Falta pouco",style: Theme.of(context).textTheme.headlineSmall,),
              Text("Esta é a última etapa camarada!", style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: primaryColor),),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 16,top: 16),
          child: Text("Insira a descrição",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF9C9C9C).withOpacity(0.01),
            borderRadius: BorderRadius.circular(16)
          ),
          child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: QuillSimpleToolbar(
            controller: _uploadController.controller,
            configurations: _uploadController.toolbarConfig,
          ),
        ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Expanded(
            child: QuillEditor.basic(
          controller: _uploadController.controller,
          
          configurations: const QuillEditorConfigurations(
            placeholder: "Insira uma descrição",
            
          ),
          ),
          )
        ),
      ],
    ),
    );
  }
}
