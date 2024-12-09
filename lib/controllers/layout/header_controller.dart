import 'package:bazar_popular/helpers/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
part 'header_controller.g.dart';

class HeaderController = HeaderControllerStore with _$HeaderController;


abstract class HeaderControllerStore with Store {

  @observable
  String selectedUserAction = "";

  @observable
  String selectProductAction = "";

  @action
  onSelectedUserAction(BuildContext context, String item) {
    print(item);
    selectedUserAction = item;
    try {
      context.go("/$item");
    }
    catch (err) {
      print(err);
    }
  }

  @action
  onSelectedProductAction(BuildContext context, String item) {
    print(item);
        try {
      context.go("/$item");
    }
    catch (err) {
      print(err);
    }
  }


}