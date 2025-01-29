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

  EventEmitterStore() {
  reaction<String?>(
    (_) => loggedUserId,
    (id) async {
      if (id != null) {
        userInfo = await _userService.getUserInfo(id);
      } else {
        userInfo = null;
      }
    },
    fireImmediately: true, // Executa imediatamente se loggedUserId já tiver valor
  );
}

  @observable
  String eventData = '';

  @observable
  String? loggedUserId; // ID do usuário logado (null se não estiver logado)

  @computed
  bool get isLogged => loggedUserId != null; 

  @action
  void setEventData(String data) {
    eventData = data;
  }
  
  @action
  checkIsLogged() async {
    
    final value = await getInstace('user_id');
    loggedUserId = value;
  }
}

final emitterStore = EmitterStore();