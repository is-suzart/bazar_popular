import 'package:bazar_popular/shared/emitter/emitter_store.dart';
import 'package:bazar_popular/shared/helpers/go.dart';
import 'package:bazar_popular/shared/helpers/local.dart';
import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  final _bazarGo = BazarGo();
  final _emitterStore = emitterStore;

  Logout({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    if (_emitterStore.isLogged) {
      await removeInstance('user_id');
      await removeInstance('auth_token');
      await removeInstance('user_info');
      _emitterStore.checkIsLogged();
    }
    _bazarGo.go(context, '/login');
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
