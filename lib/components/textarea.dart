// import 'package:bazar_popular/theme/theme.dart';
// import 'package:flutter/material.dart';
// // import 'package:reactive_md_editable_textinput/reactive_md_editable_textinput.dart';


// class BazarTextarea extends StatelessWidget{
//   const BazarTextarea({super.key, this.prefixIcon, this.hasBorder, this.inputFormatter, required this.formControlName, required this.placeholder});


//   final Icon? prefixIcon;
//   final bool? hasBorder;
//   final dynamic inputFormatter;
//   final String formControlName;
//   final String placeholder;

  
//   @override
//   Widget build(BuildContext context) {
//     return ReactiveMarkdownEditableTextInput(
//       formControlName: formControlName,
//       decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                                   borderSide: hasBorder == true ? const BorderSide(width: 1.0,color: Color(0x4C9C9C9C),strokeAlign: BorderSide.strokeAlignInside) :  BorderSide.none,
//                                   borderRadius: BorderRadius.circular(8)),
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 8, horizontal: 24),
//                               fillColor: backgroundColor,
//                               filled: true,
//                               prefixIcon: prefixIcon ?? prefixIcon ,
//                               label: Text(
//                                 placeholder,
//                                 style: Theme.of(context).textTheme.bodySmall!,
//                               )),
//     );
//   }
  
// }