import 'package:bazar_popular/shared/components/input.dart';
import 'package:bazar_popular/_controllers/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:bazar_popular/shared/theme/theme.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginController _loginController = LoginController();
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
                    return Stack(children: <Widget>[
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
                          child: Observer(builder: (_) {
                            if(_loginController.showLoginInfoMobile){
                              return Column(key: const ValueKey(1), children: [
                                const LoginInfos(screenType: "mobile"),
                                ElevatedButton(
                                    onPressed: () {
                                      _loginController.toggleLoginInfo();
                                    },
                                    style: buttonStyles['primary'],
                                    child: const Text("Avançar para login"))
                              ]);
                            } else {
                              return LoginForm(
                                isModal: false, key: const ValueKey(2)
                              );
                            }
                          }))
                    ]);
                  }),
              Breakpoints.largeAndUp: SlotLayout.from(
                  key: const Key("loginBodyMobile"),
                  builder: (context) {
                    return LayoutGrid(
                        columnGap: 24,
                        columnSizes: twelveGrid,
                        rowSizes: [
                          1.0.fr
                        ],
                        children: [
                          const LoginInfos(screenType: 'desktop')
                              .withGridPlacement(
                                  columnSpan: 6, columnStart: 1, rowStart: 0),
                          LoginForm(
                            isModal: false,
                          ).withGridPlacement(
                              columnSpan: 4, columnStart: 7, rowStart: 0)
                        ]);
                  })
            })));
  }
}

class LoginInfos extends StatelessWidget {
  const LoginInfos({super.key, required this.screenType});

  final String screenType;

  double bazarArtSize(context) {
    if (screenType == 'desktop') {
      return MediaQuery.of(context).size.width / 4.3;
    } else {
      return MediaQuery.of(context).size.width * 0.6;
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
                        Text("Seu Bazar Popular!",
                            textAlign: screenType == 'mobile'
                                ? TextAlign.center
                                : null,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(color: blackColor, fontSize: 40)),
                        Text("E revolucionário!",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: primaryColor))
                      ])),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 36),
                  width: bazarArtSize(context),
                  child: Image.asset('assets/bazar icon.png',
                      width: bazarArtSize(context)))
            ]));
  }
}

class LoginForm extends StatelessWidget {
  LoginForm({super.key, required this.isModal, this.tellIsLogged});
  final bool isModal;
  final Future<void> Function()? tellIsLogged;
  final _loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = Breakpoints.largeAndUp.isActive(context);
    return ReactiveForm(
        formGroup: _loginController.form,
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 48),
            child: Card(
                child: Container(
                    padding: !isLargeScreen && isModal
                        ? const EdgeInsets.symmetric(
                            vertical: 24, horizontal: 8)
                        : const EdgeInsets.symmetric(
                            vertical: 24, horizontal: 64),
                    alignment: Alignment.center,
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(children: [
                            Text("Camarada",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(color: primaryColor)),
                            Text("Bem vindo de volta!",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: blackColor))
                          ]),

                          Column(children: [
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: const BazarInput(
                                    placeholder: "Email",
                                    formControlName: 'email')),
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Observer(builder: (context) {
                                  return BazarInput(
                                    placeholder: "Senha",
                                    formControlName: 'password',
                                    obscureText: _loginController
                                        .showInputPasswordContent,
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          _loginController
                                              .toggleInputPasswordContentVisibility();
                                        },
                                        icon: const Icon(
                                            Icons.remove_red_eye_rounded)),
                                    submitVoid: () {
                                      _loginController.performLogin(
                                          context, isModal);
                                      if (isModal && tellIsLogged != null) {
                                        tellIsLogged!();
                                      }
                                    },
                                  );
                                })),
                            Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(bottom: 36),
                                child: TextButton(
                                    style: buttonStyles['textButton'],
                                    onPressed: () => _loginController
                                        .openModalForgotPassword(context),
                                    child: Text("Esqueci minha senha",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: primaryColor,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: primaryColor,
                                                decorationThickness: 2)))),
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 16),
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                      _loginController.performLogin(
                                          context, isModal);
                                      if (isModal && tellIsLogged != null) {
                                        tellIsLogged!();
                                      }
                                    },
                                    style: buttonStyles['primary'],
                                    child: const Text("Login"))),
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 16),
                                width: double.infinity,
                                child: OutlinedButton(
                                    style: buttonStyles["outlined"],
                                    onPressed: () {},
                                    child: const Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.g_mobiledata),
                                          Text("Login com Google")
                                        ]))),
                            Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(bottom: 36),
                                child: TextButton(
                                    style: buttonStyles['textButton'],
                                    onPressed: () => _loginController
                                        .openModalSignUp(context),
                                    child: Text("Criar conta",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: primaryColor,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: primaryColor,
                                                decorationThickness: 2))))
                          ])

                          // OutlinedButton(
                          //     onPressed: null
                          //     child: Row(
                          //       children: [
                          //         Icon(Icons.g_mobiledata)
                          //         Text("Login com Google")
                          //       ]
                          //     ))
                        ])))));
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
              color: Colors.black.withAlpha(64),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 0))
        ]),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset("assets/logo-bp.png")]));
  }
}
