import 'package:bazar_popular/components/input.dart';
import 'package:bazar_popular/controllers/login/forgot_password_controller.dart';
import 'package:bazar_popular/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final forgotpasswordcontroller = Forgotpasswordcontroller();
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.grey),
                  onPressed: () {
                    Navigator.pop(context);
                  })),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 48),
              child: ReactiveForm(
                  formGroup: forgotpasswordcontroller.form,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Esqueceu sua senha?",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(color: primaryColor)),
                        Text("Vamos recuperar camarada!",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: blackColor,
                                    fontWeight: FontWeight.bold)),
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 36),
                            child: const BazarInput(
                              placeholder: "Digite seu email",
                              formControlName: 'recovery-email',
                              icon: Icon(Icons.mail_outline_outlined),
                              hasBorder: true,
                              //errorText: "Digite um email válido",
                            )),
                        ElevatedButton(
                            onPressed: () {},
                            style: buttonStyles['primary'],
                            child: const Center(child: Text("Recuperar senha")))
                      ])))
        ]);
  }
}
