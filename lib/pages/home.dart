
import 'package:bazar_popular/components/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
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
    final bool isExtraLargeScreen = Breakpoints.extraLarge.isActive(context);
    final bool isTabletScreen = Breakpoints.mediumAndUp.isActive(context);
    final bool isLargeTablet = Breakpoints.mediumLarge.isActive(context);
    final bool isLargeScreen = Breakpoints.largeAndUp.isActive(context);
    return AdaptiveLayout(
      body: SlotLayout(
        config: {
          Breakpoints.smallAndUp: SlotLayout.from(
              key: const Key("home-body"),
              builder: (context) {
                return Container(
                  padding: isLargeScreen ? const EdgeInsets.fromLTRB(64, 32, 64, 24) : const EdgeInsets.fromLTRB(16, 32, 16, 24),
                  child: Column(children: [
                    Expanded(
                        child: GridView.count(
                      crossAxisCount: isLargeScreen ? 4 : isLargeTablet ? 3 : 2,
                      shrinkWrap: true,
                      childAspectRatio: isExtraLargeScreen ? 9 / 12 : isLargeScreen? 8.3 / 12 : isLargeTablet? 8.1 / 12 : !isTabletScreen ? 7 / 12 :  7.0 / 12,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      children: const [
                        BazarCard(
                            img:
                                "https://fakeimg.pl/1080x1080/0020a1/ffffff?text=Bazar&font=bebas"),
                        BazarCard(
                            img:
                                "https://fakeimg.pl/1080x1080/0020a1/ffffff?text=Bazar&font=bebas"),
                        BazarCard(
                            img:
                                "https://fakeimg.pl/1080x1080/0020a1/ffffff?text=Bazar&font=bebas"),
                        BazarCard(
                            img:
                                "https://fakeimg.pl/1080x1080/0020a1/ffffff?text=Bazar&font=bebas")
                      ],
                    ))
                  ]),
                );
              })
        },
      ),
    );

    /*; */
  }
}
