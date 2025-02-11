import 'package:bazar_popular/shared/components/card.dart';
import 'package:bazar_popular/shared/helpers/go.dart';
import 'package:bazar_popular/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class CreateProductShell extends StatelessWidget {
  const CreateProductShell({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = Breakpoints.largeAndUp.isActive(context);
    return SingleChildScrollView(
      physics: isLargeScreen ? const NeverScrollableScrollPhysics() : null,
      child: Container(
        margin: isLargeScreen
            ? const EdgeInsets.only(top: 36, bottom: 36)
            : const EdgeInsets.only(top: 24, bottom: 24, left: 16, right: 16),
        child: LayoutGrid(
          columnSizes: twelveGrid,
          rowSizes: const [auto],
          rowGap: 24,
          children: [
            Card(
                child: Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
              child: child,
            )).withGridPlacement(
                columnSpan: isLargeScreen ? 8 : 12,
                columnStart: isLargeScreen ? 2 : 0,
                rowStart: 0)
          ],
        ),
      ),
    );
  }
}

class CreateProductStepOne extends StatelessWidget {
  CreateProductStepOne({super.key});

  final _bazarGo = BazarGo();

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = Breakpoints.largeAndUp.isActive(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              Text("Olá camarada!",
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: !isLargeScreen ? TextAlign.center : null),
              Text(
                "O que vamos divulgar hoje?",
                textAlign: !isLargeScreen ? TextAlign.center : null,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: primaryColor),
              )
            ],
          ),
        ),
        Expanded(
            child: LayoutGrid(
          columnSizes: isLargeScreen ? [1.0.fr, 1.0.fr, 1.0.fr] : [1.0.fr],
          rowSizes: isLargeScreen ? [1.0.fr] : [auto, auto, auto],
          children: [
            BazarInfoCard(
                image: "assets/arts/product.png",
                title: "Produto",
                onTap: _bazarGo.onTapGo(context, "/divulgar/produto")),
            BazarInfoCard(
                image: "assets/arts/rifa.png",
                title: "Rifa",
                onTap: _bazarGo.onTapGo(context, "/divulgar/rifa")),
            BazarInfoCard(
                image: "assets/arts/event.png",
                title: "Evento",
                onTap: _bazarGo.onTapGo(context, "/divulgar/evento")),
          ],
        )),
      ],
    );
  }
}
