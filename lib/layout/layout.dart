import 'package:bazar_popular/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class LayoutBazar extends StatefulWidget{
  const LayoutBazar({super.key,required this.child});

  final Widget child;

  @override
  State<LayoutBazar> createState() => _LayoutBazarState();
}

class _LayoutBazarState extends State<LayoutBazar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: AdaptiveLayout(
      topNavigation: SlotLayout(
        config: {
          Breakpoints.smallAndUp : SlotLayout.from(
            key: const Key("layout-mobile"),
            builder: (context) {
              return const HeaderLogin();
            })
        }),
      body: SlotLayout(
        config: {
          Breakpoints.largeAndUp : SlotLayout.from(
            key: const Key("layout-desktop"),
            builder: (context) {
              return widget.child;
            })
        } ),
    ),
    );
  }
}
