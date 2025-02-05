import 'package:bazar_popular/shared/helpers/hive/user_adapter.dart';
import 'package:bazar_popular/shared/validators/message_error_validator.dart';
import 'package:bazar_popular/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:bazar_popular/shared/helpers/routes.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:reactive_forms/reactive_forms.dart'; // Adicionar

void main() {
  usePathUrlStrategy();
  initializeHive();
  runApp(const MyApp());
}

void initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
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
