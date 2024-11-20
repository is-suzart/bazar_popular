import 'package:bazar_popular/components/input.dart';
import 'package:bazar_popular/controllers/login/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:bazar_popular/theme/theme.dart';
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
    return ReactiveForm(formGroup: _signupController.form, child: Stack(children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: Column(children: [
          Text(
            "Estamos muito feliz de ver você aqui!",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: primaryColor),
          ),
          Text(
            "Seja bem vindo camarada!",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 24),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: const BazarInput(
              placeholder: "Qual seu nome?",
              hasBorder: true,
              formControlName: 'name',
              //errorText: "Campo obrigatório",
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: const BazarInput(
              placeholder: "Qual seu email?",
              formControlName: 'email',
              hasBorder: true,
              //errorText: "Digite um email válido",
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: BazarInput(
              placeholder: "Qual seu telefone?",
              formControlName: 'telephone',
              hasBorder: true,
              inputFormatter: _signupController.telephoneMaskFormatter,
              //errorText: "Digite um telefone válido",
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 24),
            child: ElevatedButton(
              onPressed: _signupController.onSubmit,
              style: buttonStyles['primary'],
              child: const Text("Avançar"),
            ),
          ),
        ]),
      )
    ]));
  }
}
