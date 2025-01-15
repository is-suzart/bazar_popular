import 'package:bazar_popular/layout/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class LayoutBazar extends StatelessWidget{
  const LayoutBazar({super.key,required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SelectionArea(
        child: AdaptiveLayout(
      topNavigation: SlotLayout(
        config: {
          Breakpoints.smallAndUp : SlotLayout.from(
            key: const Key("layout-mobile"),
            builder: (context) {
              return Header();
            })
        }),
      body: SlotLayout(
        config: {
          Breakpoints.smallAndUp : SlotLayout.from(
            key: const Key("layout-final"),
            builder: (context) {
              return child;
            })
        } ),
    ))
    );
  }
}
