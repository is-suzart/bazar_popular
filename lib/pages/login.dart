import 'package:bazar_popular/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:bazar_popular/theme/theme.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AdaptiveLayout(
      topNavigation: SlotLayout(
        config: {
          Breakpoints.smallAndUp : SlotLayout.from(
            key: const Key("Header Mobile"),
            builder: (context) {
              return const Header();
            }
)
        
}
),
        body: SlotLayout(config: {
          Breakpoints.smallAndUp: SlotLayout.from(
            key: const Key("loginBodyMobile"),
            builder: (context) {
              return LayoutGrid(
                columnSizes: [1.0.fr,1.0.fr], 
                rowSizes: [1.0.fr],
                children: [
                  LoginInfos(),
                  LoginInfos(),
                ],);
            }
)
        }
)
)
);
  }
}

class LoginInfos extends StatelessWidget{
  const LoginInfos({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48,horizontal: 64),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
                Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                              
                  RichText(
                    text: TextSpan(
                      text: "Seu Bazar Popular!",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: blackColor),
                    )
                  ),
                  Text("E revolucionário!",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: primaryColor)
                  )

              ]
              ),
                  Image.asset(
                    'assets/bazar icon.png',
                    width: MediaQuery.of(context).size.width / 3,)
        ]
));
  }
}
