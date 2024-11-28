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
  Future<void> performLogin(context) async {
    // Simulação de chamada de API ou lógica de autenticação
    final email = form.control('email').value;
    final password = form.control('password').value;
    final response = await LoginService().login(email, password);
    if(response.status == 'success') {
      GoRouter.of(context).go('/');
    }
  }
}

