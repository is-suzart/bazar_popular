import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
part 'header_controller.g.dart';

class HeaderController = HeaderControllerStore with _$HeaderController;


abstract class HeaderControllerStore with Store {

  @action
  onSelectedAction(BuildContext context, String item) {
    context.go("/$item");
  }


}