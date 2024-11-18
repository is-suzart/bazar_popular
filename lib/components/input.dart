import 'package:bazar_popular/theme/theme.dart';
import 'package:flutter/material.dart';

class BazarInput extends StatelessWidget {
  const BazarInput({super.key,required this.placeholder, this.onchaged,this.icon,this.hasBorder});
  final String placeholder;
  final void Function(String)? onchaged;
  final Icon? icon;
  final bool? hasBorder;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onchaged ?? onchaged,
      style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: blackColor),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                  borderSide: hasBorder == true ? const BorderSide(width: 1.0,color: Color(0x4C9C9C9C)) :  BorderSide.none,
                                  borderRadius: BorderRadius.circular(8)),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 24),
                              fillColor: backgroundColor,
                              filled: true,
                              prefixIcon: icon ?? icon ,
                              label: Text(
                                placeholder,
                                style: Theme.of(context).textTheme.bodySmall!,
                              ))
    );
  }
}