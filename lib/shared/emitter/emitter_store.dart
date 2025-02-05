import 'package:bazar_popular/models/user_models.dart';
import 'package:bazar_popular/services/user_service.dart';
import 'package:bazar_popular/shared/helpers/local.dart';
import 'package:mobx/mobx.dart';

part 'emitter_store.g.dart';

class EmitterStore = EventEmitterStore with _$EmitterStore;

abstract class EventEmitterStore with Store {
  @observable
  UserModels? userInfo;

  final _userService = UserService();

  @observable
  String eventData = '';

  @observable
  String? loggedUserId; // ID do usuário logado (null se não estiver logado)

  @computed
  bool get isLogged => loggedUserId != null || userInfo != null;

  @computed
  bool get hasUserInfo => userInfo != null;

  @action
  void setEventData(String data) {
    eventData = data;
  }

  @action
  checkIsLogged() async {
    final value = await getInstance('user_id');
    loggedUserId = value;
  }

  @action
  updateUserInfo(String? id) async {
    final String? value = await getInstance('user_id');
    if (value == null && id == null) {
      return null;
    }
    final UserModels? user = await getInstance('user_info');
    if (user == null) {
      userInfo = await _userService.getUserInfo(id ?? value!);
      setInstance('user_info', userInfo!);
    } else {
      userInfo = user;
    }
  }
}

final emitterStore = EmitterStore();
