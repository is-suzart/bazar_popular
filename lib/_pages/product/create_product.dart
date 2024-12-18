import 'package:bazar_popular/shared/components/input.dart';
import 'package:bazar_popular/_controllers/product/create_product_controller.dart';
import 'package:bazar_popular/shared/helpers/go.dart';
import 'package:bazar_popular/models/product_models.dart';
import 'package:bazar_popular/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
//import 'package:reactive_checkbox/reactive_checkbox.dart';
//
class CreateProduct extends StatelessWidget {
  final _bazarGo = BazarGo();
  final _createProductController = CreateProductController();
  static const inputPadding = EdgeInsets.symmetric(vertical: 16);
  CreateProduct({super.key});
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?; 
    final tipo = arguments?['tipo'];
    CreateProductFormModel formContent = _createProductController.buildForm(tipo);
    return SingleChildScrollView(
      child: Container(
      padding: const EdgeInsets.symmetric(vertical: 36,horizontal: 48),
      child: Column(
        children: [
          Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            Text("camarada!",style: Theme.of(context).textTheme.headlineSmall),
            Text(formContent.title,style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: primaryColor),)
          ],
        ),
      ),
      ReactiveForm(formGroup: _createProductController.form, 
      child: Column(
        children: [
          Container(
            margin: inputPadding,
            child: BazarInput(placeholder: formContent.subtitle,formControlName: "subtitle",),
          ),
          Container(
            margin: inputPadding,
            child: BazarInput(placeholder: formContent.name,formControlName: "name",),
          ),
          Container(
            margin: inputPadding,
            child: BazarInput(placeholder: formContent.value,formControlName: "value",inputFormatter: _createProductController.currencyMaskFormatter,),
          ),
          Container(
            margin: inputPadding,
            child: Row(
              children: [
                ReactiveCheckbox(
              formControlName: 'isPromo',
              //fillColor: const WidgetStatePropertyAll(primaryColor),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16),
              child: Text(formContent.isPromo,style: Theme.of(context).textTheme.bodySmall!.copyWith(color: blackColor),),
            )
              ],
            )
          ),
          ReactiveValueListenableBuilder<bool>( 
            formControlName: 'isPromo', builder: (context, control, child) { 
              return control.value == true ? 
            Column(
                  children: [
            Container(
              margin: inputPadding,
              child: BazarInput(placeholder: formContent.quantidadePromo,formControlName: "quantidadePromo",inputFormatter: FilteringTextInputFormatter.digitsOnly,),
            ),
            Container(
              margin: inputPadding,
              child: BazarInput(placeholder: formContent.valuePromo,formControlName: "valuePromo",inputFormatter: _createProductController.currencyMaskFormatter,),
            )
                  ],): Container();
            }, ),
                        Container(
              margin: inputPadding,
              child: BazarInput(placeholder: formContent.storage,formControlName: "storage",inputFormatter: FilteringTextInputFormatter.digitsOnly,),
            ),
            if(formContent.place != null)
            Container(
              margin: inputPadding,
              child: BazarInput(placeholder: formContent.place!,formControlName: "place",),
            ),
            Container(
              margin: inputPadding,
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(child: ElevatedButton(onPressed: _bazarGo.onTapGo(context,'/divulgar'),style: buttonStyles['textButton'], child: Text("Voltar"),)),
                    const SizedBox(width: 16),
                    Expanded(child: ElevatedButton(onPressed: () => _createProductController.onSubmit()
                    ,
                    style: buttonStyles['primary'], child: const Text("Avançar"),))
                  ],
                )),
            )
  

        ],
      ))
        ],
      )
    ),
    );
  }

}