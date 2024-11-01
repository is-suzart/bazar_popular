import 'package:bazar_popular/theme/theme.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: const Icon(Icons.menu_rounded),
        title: Center(
            child: Image.asset(
          "assets/logo-bp.png",
          width: 100,
        )),
      ),
      body: Center(
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Seu Bazar Popular!",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: blackColor),
                  ),
                  Text("E revolucionário!",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: primaryColor)),
                  Center(
                    child: Image.asset(
                      'assets/bazar icon.png',
                      width: 500,
                    ),
                  )
                ],
              ),
              Column(children: [
                Text(texto),
                ElevatedButton(
                    onPressed: onPressed, child: const Text("Mudar texto"))
              ])
            ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
