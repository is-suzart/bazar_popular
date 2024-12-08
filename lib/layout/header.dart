import 'package:bazar_popular/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:bazar_popular/controllers/layout/header_controller.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = Breakpoints.largeAndUp.isActive(context);
    return Container(
        height: kToolbarHeight,
        padding: isLargeScreen
            ? const EdgeInsets.symmetric(vertical: 8, horizontal: 64)
            : const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 0),
          )
        ]),
        child: Center(
          child: LayoutGrid(columnSizes: twelveGrid, rowSizes: [
            1.0.fr
          ], children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  child: Image.asset("assets/logo-bp.png"),
                  onTap: () {
                    context.go("/");
                  },
                ),
              ),
            ).withGridPlacement(
                columnSpan: isLargeScreen ? 2 : 10,
                columnStart: 0,
                rowStart: 0),
            if (isLargeScreen)
              Center(
                child: TextField(
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: blackColor),
                  decoration: InputDecoration(
                      fillColor: backgroundColor,
                      filled: true,
                      prefixIcon: const Icon(Icons.search_rounded),
                      label: Text("Buscar por itens revolucionários",
                          style: Theme.of(context).textTheme.bodySmall!),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 24)),
                ),
              ).withGridPlacement(columnSpan: 4, columnStart: 4, rowStart: 0),
            UserHeader()
          ]),
        ));
  }
}

class UserHeader extends StatelessWidget {
  UserHeader({super.key});

  final _headerController = HeaderController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(right: 24),
          alignment: Alignment.center,
          child: PopupMenuButton(
              tooltip: "Ver carrinho",
              icon: const Icon(Icons.shop_2_outlined),
              offset: Offset.fromDirection(-100, kToolbarHeight + 45),
              itemBuilder: (BuildContext context) => []),
        ),
        Container(
            padding: const EdgeInsets.only(right: 24),
            alignment: Alignment.center,
            child: PopupMenuButton(
                offset: Offset.fromDirection(-100, kToolbarHeight + 45),
                tooltip: "Ver perfil e opções",
                onSelected: (String selected) {
                  _headerController.onSelectedUserAction(selected);
                } ,
                icon: const Icon(Icons.person_2_rounded),
                itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                          value: 'meu-perfil',
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [Icon(Icons.person), Text("Meu perfil")],
                          ))
                    ])),
      ],
    ).withGridPlacement(columnSpan: 2, columnStart: 10, rowStart: 0);
  }
}
/*

Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/logo-bp.png"),
          Center(
            child: Text('teste')
          ),
          Row(
            children: [
              Icon(Icons.person),
              Icon(Icons.person),
              
            ],
          )
        ],
      ),
*/