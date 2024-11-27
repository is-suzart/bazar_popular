// import 'package:flutter/material.dart';
// import 'package:reactive_forms/reactive_forms.dart';

// class BazarDropdown extends StatelessWidget {
//   const BazarDropdown({super.key,required this.options, required this.placeholder});
//   final List<String> options;

//   @override
//   Widget build(BuildContext context) {
//     return ReactiveDropdownField(
//       items: options,
//       decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                                   borderSide: hasBorder == true ? const BorderSide(width: 1.0,color: Color(0x4C9C9C9C),strokeAlign: BorderSide.strokeAlignInside) :  BorderSide.none,
//                                   borderRadius: BorderRadius.circular(8)),
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 8, horizontal: 24),
//                               fillColor: backgroundColor,
//                               filled: true,
//                               //prefixIcon: prefixIcon ?? prefixIcon ,
//                               //suffixIcon: suffixIcon ?? suffixIcon,
//                               label: Text(
//                                 placeholder,
//                                 style: Theme.of(context).textTheme.bodySmall!,
//                               )),);
    
//   }
// }