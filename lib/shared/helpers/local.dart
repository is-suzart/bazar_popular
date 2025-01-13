import 'package:shared_preferences/shared_preferences.dart';

  getInstace(String instance) async {
   final prefs = await SharedPreferences.getInstance();
   return prefs.getString(instance);
  }

  setInstance(String instance,String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(instance,value);
  }
  String setImageUrl (String url){
    const String apiUrl = 'http://localhost:8080'; 
    if (!url.startsWith('http')) { 
      if (url.startsWith('./')) { 
        url = url.substring(1); 
      }
      return '$apiUrl$url'; 
      } 
      return url;
  }