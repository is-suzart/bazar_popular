import 'package:bazar_popular/components/input.dart';
import 'package:bazar_popular/controllers/login/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:bazar_popular/theme/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final SignupController _signupController = SignupController();

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
        formGroup: _signupController.form,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: Column(children: [
            Text(
              "Estamos muito feliz de ver você aqui!",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: primaryColor),
            ),
            Text(
              "Seja bem-vindo, camarada!",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 24),
            Observer(
              builder: (_) {
                // Aqui a lógica de visibilidade é controlada pelo step
                return IndexedStack(
                  index: _signupController.step,
                  children: [
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
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: const BazarInput(
                              placeholder: "Qual seu nome?",
                              hasBorder: true,
                              formControlName: 'name',
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: const BazarInput(
                              placeholder: "Qual seu email?",
                              formControlName: 'email',
                              hasBorder: true,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: BazarInput(
                              placeholder: "Qual seu telefone?",
                              formControlName: 'telephone',
                              hasBorder: true,
                              inputFormatter:
                                  _signupController.telephoneMaskFormatter,
                            ),
                          ),
                          Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(top: 24),
                              child: ElevatedButton(
                                onPressed: () => _signupController.nextStep(),
                                style: buttonStyles['primary'],
                                child: const Text("Avançar"),
                              )),
                        ],
                      ),
                    ),
                    //index 0

                    // Index 1
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: const BazarInput(
                            placeholder: "Digite sua senha",
                            formControlName: 'password',
                            hasBorder: true,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: const BazarInput(
                            placeholder: "Repita sua senha",
                            formControlName: 'repeat-password',
                            hasBorder: true,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: const BazarInput(
                            placeholder: "Qual seu estado?",
                            formControlName: 'state',
                            hasBorder: true,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: const BazarInput(
                            placeholder: "Qual sua cidade?",
                            formControlName: 'city',
                            hasBorder: true,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 24),
                          width: double.infinity,
                          child: Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  onPressed: _signupController.previousStep,
                                  style: buttonStyles['textButton'],
                                  child: const Text('Voltar')),
                              ElevatedButton(
                                  onPressed: () => _signupController.onSubmit(context),
                                  style: buttonStyles['primary'],
                                  child: const Text('Cadastrar'))
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          ]),
        ));
  }
}
