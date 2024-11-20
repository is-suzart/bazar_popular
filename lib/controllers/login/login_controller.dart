import 'package:reactive_forms/reactive_forms.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';


class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
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
  Future<void> performLogin() async {
    // Simulação de chamada de API ou lógica de autenticação
    final email = form.control('email').value;
    final password = form.control('password').value;

    print('Autenticando $email com senha $password...');
    await Future.delayed(const Duration(seconds: 1)); // Simulando delay da API
    print('Login bem-sucedido!');
  }
}

