import 'package:bazar_popular/shared/validators/message_error_validator.dart';
import 'package:bazar_popular/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:bazar_popular/shared/helpers/routes.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:reactive_forms/reactive_forms.dart'; // Adicionar


void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: errorMessages,
      child: MaterialApp.router(
      title: 'Bazar Popular',
      theme: bazarPopularTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    ));
  }
}
