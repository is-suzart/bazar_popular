import 'package:bazar_popular/_controllers/product/upload/upload_product_controller.dart';
import 'package:bazar_popular/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
                Text(
                  "Falta pouco",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "Esta é a última etapa, camarada!",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: primaryColor),
                ),
              ],
            ),
          ),
          /* UPLOAD DE IMAGENS
          
          
          */
          Container(
            margin: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Faça o upload das fotos de divulgação",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: const Text(
                      "Recomendamos fotos no tamanho 1080 x 1080 e não é permitido mais que 4 fotos"),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ElevatedButton(
                    onPressed: () => _uploadController.getPhotos(context),
                    style: buttonStyles['primary'],
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: const Icon(Icons.upload_file_rounded),
                          ),
                          const Text("Escolha as fotos")
                        ])),
                ),
                        Observer(builder: (_) {
                          if(_uploadController.imageNames.isNotEmpty) {
                            return Flexible(
                              fit: FlexFit.loose,
                              child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _uploadController.imageNames.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 12.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: primaryColor),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(right: 8),
                                        child: Image.network(_uploadController.storeImgs[index].path,height: 32),
                                      ),
                                      Text(
                                    _uploadController.imageNames[index],
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Spacer(),
                                  IconButton(onPressed: () {
                                    _uploadController.removeImageByIndex(index);
                                  }, 
                                  icon: Icon(Icons.delete, color: Colors.red))
                                    ],
                                  ),
                                );
                              },
                            ));
                          } else {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 16),
                              alignment: Alignment.center,
                              child: Text('Nenhuma imagem selecionada',style: Theme.of(context).textTheme.bodyMedium,),
                            );
                          }
                        }),
              ],
            ),
          ),



          Container(
            margin: const EdgeInsets.only(top: 24,bottom: 12),
            child: Text("Qual o tipo de chave pix?",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: DropdownButtonFormField(
              items: _uploadController.dropdownItems, 
              onChanged: (value) => _uploadController.setChavePix = value!,
              value: _uploadController.chavePix,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1.0, color: Color(0x4C9C9C9C), strokeAlign: BorderSide.strokeAlignInside),borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24), fillColor: backgroundColor, filled: true,
                prefixIcon: const Icon(Icons.pix_rounded)
              ),
              )
          ),
          // Container(
          //   margin: EdgeInsets.symmetric(vertical: 16),
          //   child: Observer(builder: (_) {

          //   }),
          // )

          /*
          
          DESCRIÇÃO


          */
          Container(
            margin: const EdgeInsets.only(bottom: 16, top: 24),
            child: Text("Insira a descrição",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFF9C9C9C).withOpacity(0.01),
                borderRadius: BorderRadius.circular(16)),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: QuillSimpleToolbar(
                controller: _uploadController.controller,
                configurations: _uploadController.toolbarConfig,
              ),
            ),
          ),
          Container(
              child: QuillEditor.basic(
                
                  controller: _uploadController.controller,
                  configurations: const QuillEditorConfigurations(
                    placeholder: "Insira uma descrição",
                    minHeight: 300
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
