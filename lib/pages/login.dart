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
            topNavigation: SlotLayout(config: {
              Breakpoints.smallAndUp: SlotLayout.from(
                  key: const Key("Header Mobile"),
                  builder: (context) {
                    return const Header();
                  })
            }),
            body: SlotLayout(config: {
              Breakpoints.smallAndUp: SlotLayout.from(
                  key: const Key("loginBodyMobile"),
                  builder: (context) {
                    return LayoutGrid(
                      columnGap: 24,
                      columnSizes: [
                        1.0.fr,
                        1.0.fr,
                        1.0.fr,
                        1.0.fr,
                        1.0.fr,
                        1.0.fr,
                        1.0.fr,
                        1.0.fr,
                        1.0.fr,
                        1.0.fr,
                        1.0.fr,
                        1.0.fr
                      ],
                      rowSizes: [1.0.fr],
                      children: [
                        const LoginInfos().withGridPlacement(
                            columnSpan: 5, columnStart: 1, rowStart: 0),
                        const LoginForm().withGridPlacement(
                            columnSpan: 5, columnStart: 6, rowStart: 0),
                      ],
                    );
                  })
            })));
  }
}

class LoginInfos extends StatelessWidget {
  const LoginInfos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 64),
        alignment: Alignment.center,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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
                    )),
                    Text("E revolucionário!",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: primaryColor))
                  ]),
              Image.asset(
                'assets/bazar icon.png',
                width: MediaQuery.of(context).size.width / 3.5,
              )
            ]));
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool showPassword = false;

  void togglePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Card(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 64),
          alignment: Alignment.center,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("Camarada",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: primaryColor)),
                    Text("Bem vindo de volta!",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: blackColor)),
                  ],
                ),

                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: TextField(
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: blackColor),
                        decoration: InputDecoration(
                            fillColor: backgroundColor,
                            filled: true,
                            label: Text("Email",
                                style: Theme.of(context).textTheme.bodySmall!),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8)),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 24)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: TextField(
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: blackColor),
                          obscureText: showPassword,
                          decoration: InputDecoration(
                              fillColor: backgroundColor,
                              filled: true,
                              suffixIcon: IconButton(
                                  onPressed: togglePasswordVisibility,
                                  icon:
                                      const Icon(Icons.remove_red_eye_rounded)),
                              label: Text(
                                "Senha",
                                style: Theme.of(context).textTheme.bodySmall!,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8)),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 24))),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 24),
                      child: TextButton(
                          style: buttonStyles['textButton'],
                          onPressed: togglePasswordVisibility,
                          child: Text("Esqueci minha senha",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: primaryColor,
                                    decoration: TextDecoration.underline,
                                    decorationColor: primaryColor,
                                    decorationThickness: 2,
                                  ))),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 24),
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          child: Text("Login"),
                          style: buttonStyles['primary']),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 24),
                      width: double.infinity,
                      child: const OutlinedButton(
                          onPressed: null,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.g_mobiledata),
                              Text("Login com Google")
                            ],
                          )),
                    ),
                  ],
                ),

                // OutlinedButton(
                //     onPressed: null,
                //     child: Row(
                //       children: [
                //         Icon(Icons.g_mobiledata),
                //         Text("Login com Google")
                //       ],
                //     ))
              ]),
        ),
      ),
    );
  }
}
