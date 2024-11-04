import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:bazar_popular/theme/theme.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool showLoginInfoMobile = true;

  void toggleLoginInfo() {
    setState(() {
      showLoginInfoMobile = !showLoginInfoMobile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: AdaptiveLayout(
            topNavigation: SlotLayout(config: {
              Breakpoints.smallAndUp: SlotLayout.from(
                  key: const Key("Header Mobile"),
                  builder: (context) {
                    return const HeaderLogin();
                  })
            }),
            body: SlotLayout(config: {
              Breakpoints.smallAndUp: SlotLayout.from(
                  key: const Key("loginBodyMobile"),
                  builder: (context) {
                    return Stack(
                      children: <Widget>[
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            final inAnimation = Tween<Offset>(
                                    begin: const Offset(1.0, 0.0),
                                    end: const Offset(0.0, 0.0))
                                .animate(animation);
                            final outAnimation = Tween<Offset>(
                                    begin: const Offset(0.0, 0.0),
                                    end: const Offset(-1.0, 0.0))
                                .animate(animation);
                            return SlideTransition(
                                position:
                                    animation.status == AnimationStatus.reverse
                                        ? outAnimation
                                        : inAnimation,
                                child: child);
                          },
                          child: showLoginInfoMobile
                              ? Column(
                                  key: const ValueKey(1),
                                  children: [
                                    const LoginInfos(screenType: "mobile"),
                                    ElevatedButton(
                                      onPressed: toggleLoginInfo,
                                      style: buttonStyles['primary'],
                                      child: const Text("Avançar para login"),
                                    )
                                  ],
                                )
                              : const LoginForm(key: ValueKey(2)),
                        )
                      ],
                    );
                  }),
              Breakpoints.largeAndUp: SlotLayout.from(
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
                        const LoginInfos(
                          screenType: 'desktop',
                        ).withGridPlacement(
                            columnSpan: 6, columnStart: 1, rowStart: 0),
                        const LoginForm().withGridPlacement(
                            columnSpan: 4, columnStart: 7, rowStart: 0),
                      ],
                    );
                  })
            })));
  }
}

class LoginInfos extends StatelessWidget {
  const LoginInfos({super.key, required this.screenType});

  final String screenType;

  double bazarArtSize(context) {
    if (screenType == 'desktop') {
      return MediaQuery.of(context).size.width / 3.9;
    } else {
      return MediaQuery.of(context).size.width * 0.8;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 64),
        alignment: Alignment.center,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                    mainAxisAlignment: screenType == 'desktop'
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    crossAxisAlignment: screenType == 'desktop'
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Seu Bazar Popular!",
                        textAlign:
                            screenType == 'mobile' ? TextAlign.center : null,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: blackColor, fontSize: 40),
                      ),
                      Text("E revolucionário!",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: primaryColor))
                    ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 36),
                width: bazarArtSize(context),
                child: Image.asset(
                  'assets/bazar icon.png',
                  width: bazarArtSize(context),
                ),
              ),
            ]));
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool hidePassword = true;
  String email = "";
  String password = "";

  void togglePasswordVisibility() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  void simulateLogin() {
    if (email != "" && password != "") {
      context.go("/home");
    }
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
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
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
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: blackColor),
                          obscureText: hidePassword,
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
                      margin: const EdgeInsets.only(bottom: 36),
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
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: simulateLogin,
                          style: buttonStyles['primary'],
                          child: const Text("Login")),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      width: double.infinity,
                      child: OutlinedButton(
                          style: buttonStyles["outlined"],
                          onPressed: () {},
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.g_mobiledata),
                              Text("Login com Google")
                            ],
                          )),
                    ),
                                        Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 36),
                      child: TextButton(
                          style: buttonStyles['textButton'],
                          onPressed: togglePasswordVisibility,
                          child: Text("Criar conta",
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

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({super.key});

   @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          spreadRadius: 0,
          blurRadius: 4,
          offset: const Offset(0, 0),
        )
      ]),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/logo-bp.png"),
        ],
      ),
    );
  }
}