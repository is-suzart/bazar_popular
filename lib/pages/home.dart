import 'package:bazar_popular/components/card.dart';
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
    return Container(
      padding: const EdgeInsets.fromLTRB(64, 32, 65, 24),
      child:     Column(
      children: [
        Expanded(
          child: GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          childAspectRatio: 9/12,
          crossAxisSpacing: 16,
          children: [
            BazarCard(img: "https://fakeimg.pl/1080x1080/0020a1/ffffff?text=Bazar&font=bebas"),
            BazarCard(img: "https://fakeimg.pl/1080x1080/0020a1/ffffff?text=Bazar&font=bebas"),
            BazarCard(img: "https://fakeimg.pl/1080x1080/0020a1/ffffff?text=Bazar&font=bebas"),
            BazarCard(img: "https://fakeimg.pl/1080x1080/0020a1/ffffff?text=Bazar&font=bebas")
          ],))
        
      ]),
    );

  }
}
