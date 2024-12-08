import 'package:mobx/mobx.dart';
part 'header_controller.g.dart';

class HeaderController = HeaderControllerStore with _$HeaderController;


abstract class HeaderControllerStore with Store {

  @observable
  String selectedUserAction = "";

  @action
  onSelectedUserAction(String item) {
    print(item);
    selectedUserAction = item;
  }

}