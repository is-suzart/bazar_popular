import 'package:bazar_popular/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

void openErrorDialog(BuildContext context,String text) {
    QuickAlert.show(
      context: context, 
      type: QuickAlertType.error,
      text: text,
      title: "Erro",
      confirmBtnText: "Entendido!" ,
      confirmBtnColor: primaryColor,
      cancelBtnTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white)
    );
  }