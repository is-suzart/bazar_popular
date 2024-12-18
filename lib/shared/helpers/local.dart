import 'package:shared_preferences/shared_preferences.dart';

  getInstace(String instance) async {
   final prefs = await SharedPreferences.getInstance();
   return prefs.getString(instance);
  }

  setInstance(String instance,String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(instance,value);
  }