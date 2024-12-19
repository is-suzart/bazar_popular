import 'package:bazar_popular/models/res/reponse_models.dart';
import 'package:bazar_popular/_pages/login/forgot_password.dart';
import 'package:bazar_popular/_pages/login/signup.dart';
import 'package:bazar_popular/shared/state_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:mobx/mobx.dart';
import 'package:bazar_popular/services/login_service.dart';
import 'package:go_router/go_router.dart';
part 'login_controller.g.dart';


class LoginController = LoginControllerStore with _$LoginController;


abstract class LoginControllerStore with Store {
  @observable
  bool showLoginInfoMobile = true;
  @observable
  bool showInputPasswordContent = true;

  @action
  void toggleInputPasswordContentVisibility(){
    showInputPasswordContent = !showInputPasswordContent;
  }
  @action
  void toggleLoginInfo() {
    showLoginInfoMobile = !showLoginInfoMobile;
  }
  @action
  void openModalSignUp(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.grey),
                        onPressed: () {
                          Navigator.pop(context);
                        })),
                const SignUp()
              ]);
        });
  }

  @action
  void openModalForgotPassword(BuildContext context) {
    //showModalBottomSheet(context: context, builder: (ctx) => Text("oi!"));
    showDialog(
        context: context,
        builder: (context) {
          return const Forgotpassword();
        });
  }


  final FormGroup form = FormGroup({
    'email': FormControl<String>(validators: [Validators.required, Validators.email]),
    'password': FormControl<String>(validators: [Validators.required]),
  });

  String? validateForm() {
    if (form.invalid) {
      return 'Por favor, preencha todos os campos corretamente.';
    }
    return null; // Nenhum erro
  }
@action
 Future<void> performLogin(BuildContext context) async {
  final email = form.control('email').value;
  final password = form.control('password').value;

  final SignResult result = await LoginService().login(email, password);

  if (result.isSuccess) {
    GoRouter.of(context).go('/');
  } else if (result.isError) {
    final errorMessage = result.error?.message ?? 'Erro desconhecido';
    openErrorDialog(context, errorMessage);
  } else if (result.isException) {
    openErrorDialog(context, result.exception.toString());
  }
}

}

