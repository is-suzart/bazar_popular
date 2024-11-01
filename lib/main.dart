import 'package:bazar_popular/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:bazar_popular/helpers/routes.dart';
import 'package:flutter_web_plugins/url_strategy.dart'; // Adicionar


void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Bazar Popular',
      theme: bazarPopularTheme,
      routerConfig: router,
    );
  }
}
