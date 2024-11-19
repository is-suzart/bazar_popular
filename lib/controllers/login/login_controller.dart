import 'package:reactive_forms/reactive_forms.dart';

class LoginController {
  bool showLoginInfoMobile = true;

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

  Future<void> performLogin() async {
    // Simulação de chamada de API ou lógica de autenticação
    final email = form.control('email').value;
    final password = form.control('password').value;

    print('Autenticando $email com senha $password...');
    await Future.delayed(const Duration(seconds: 1)); // Simulando delay da API
    print('Login bem-sucedido!');
  }
}

