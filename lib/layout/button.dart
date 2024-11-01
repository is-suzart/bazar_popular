import 'package:bazar_popular/theme/theme.dart';
import 'package:flutter/material.dart';

class BazarButton {

  final String type;
  final Color buttonColor;
  final Color textColor;

  BazarButton({required this.type,required this.buttonColor,required this.textColor});

  ButtonStyle buildButtonStyles(){
    switch(type){
      case 'elevated':
        return ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 20, horizontal: 24)),
      backgroundColor: WidgetStateProperty.all<Color>(buttonColor),
      foregroundColor: WidgetStateProperty.all<Color>(textColor),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ));
      case 'textButton':
        return ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 20, horizontal: 24)),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ));
      default:
        return buttonStyles['primary']!;
    }
  }
}