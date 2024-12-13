import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
part 'go.g.dart';

class BazarGo = BazarGoStore with _$BazarGo;
abstract class BazarGoStore with Store {

  @action
  void go(BuildContext context, String path){
    context.go(path);
  }

  @action
  VoidCallback onTapGo(BuildContext context,String path) {
    return () => context.go(path);
  }
}