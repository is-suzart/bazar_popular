import 'package:bazar_popular/helpers/routes.dart';
import 'package:bazar_popular/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String texto = "Salve binho";

  void onPressed() {
    setState(() {
      texto = "você mudou o texto!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center( child: Column(
      children: [
        Text("eu sou a home",style: Theme.of(context).textTheme.headlineMedium,),
        ElevatedButton(onPressed: () {
          context.go("/produto");
        }, child: Text("ir para produto"))
      ],
    ));
  }
}
