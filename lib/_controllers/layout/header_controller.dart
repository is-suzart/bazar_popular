import 'dart:async';

import 'package:bazar_popular/shared/helpers/local.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
part 'header_controller.g.dart';

class HeaderController = HeaderControllerStore with _$HeaderController;


abstract class HeaderControllerStore with Store {

  @observable
  String? userId;

  @computed
  bool get isLogged => userId != null;

  @action
  onSelectedAction(BuildContext context, String item) {
    context.go("/$item");
  }

  @action
  checkIsLogged() async {
    
    final value = await getInstace('user_id');
    userId = value;
  }
  @action
  checkIsLoggedWithDelay() async {
    Timer(const Duration(milliseconds: 1000), () async {
      await checkIsLogged();
    });
  }

}