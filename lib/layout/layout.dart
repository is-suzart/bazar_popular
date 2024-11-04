import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class LayoutBazar extends StatefulWidget{
  const LayoutBazar({super.key});

  @override
  State<LayoutBazar> createState() => _LayoutBazarState();
}

class _LayoutBazarState extends State<LayoutBazar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: AdaptiveLayout(
      body: SlotLayout(
        config: {
          Breakpoints.largeAndUp : SlotLayout.from(
            key: const Key("layout-desktop"),
            builder: (context) {
              return Center(
                child: Text("arroz",style: Theme.of(context).textTheme.headlineLarge)
              );
            })
        } ),
    ),
    );
  }
}
