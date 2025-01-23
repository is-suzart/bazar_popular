import 'package:bazar_popular/shared/helpers/go.dart';
import 'package:bazar_popular/shared/helpers/local.dart';
import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  final _bazarGo = BazarGo();

  Logout({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    final bool isLogged = await checkIsLogged();
    if (isLogged) {
      await removeInstance('user_id');
      await removeInstance('auth_token');
    }
    _bazarGo.go(context, '/login');
  }

  Future<bool> checkIsLogged() async {
    final userId = await getInstace('user_id');
    return userId != null;
  }

  @override
  Widget build(BuildContext context) {
    // Chama a função de logout assim que o widget é carregado
    Future.microtask(() => _handleLogout(context));

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
