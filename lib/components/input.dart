import 'package:bazar_popular/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class BazarInput extends StatelessWidget {
  const BazarInput({super.key,required this.placeholder, this.onchaged,this.prefixIcon,this.hasBorder,this.inputFormatter,this.formControlName,this.errorText,this.suffixIcon,this.obscureText});
  final String placeholder;
  final void Function(String)? onchaged;
  final Icon? prefixIcon;
  final bool? hasBorder;
  final dynamic inputFormatter;
  final String? formControlName;
  final String? errorText;
  final Widget? suffixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: formControlName,
      inputFormatters: inputFormatter == null ? [] : [inputFormatter!],
      style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: blackColor),
                          decoration: InputDecoration(
                            errorText: errorText ?? errorText,
                            enabledBorder: OutlineInputBorder(
                                  borderSide: hasBorder == true ? const BorderSide(width: 1.0,color: Color(0x4C9C9C9C),strokeAlign: BorderSide.strokeAlignInside) :  BorderSide.none,
                                  borderRadius: BorderRadius.circular(8)),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 24),
                              fillColor: backgroundColor,
                              filled: true,
                              prefixIcon: prefixIcon ?? prefixIcon ,
                              suffixIcon: suffixIcon ?? suffixIcon,
                              label: Text(
                                placeholder,
                                style: Theme.of(context).textTheme.bodySmall!,
                              )),
                              obscureText: obscureText != null ? obscureText == true : false,
    );
  }
}