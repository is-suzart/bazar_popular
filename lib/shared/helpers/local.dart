import 'package:shared_preferences/shared_preferences.dart';

getInstace(String instance) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(instance);
}

setInstance(String instance, String value) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.setString(instance, value);
}

removeInstance(String instance) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.remove(instance);
}


String setImageUrl(String? url) {
  const String apiUrl = 'http://localhost:8080';
  if(url != null) {
      if (!url.startsWith('http')) {
    if (url.startsWith('./')) {
      url = url.substring(1);
    }
    return '$apiUrl$url';
  }
  return url;
  } else {
    return 'https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExaHFzM2t4bmo1cGFtaHNjdGxvN3c0b2RnZXA2c3hyOWs0MmpvY3lvbCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/C21GGDOpKT6Z4VuXyn/giphy.gif';
  }

}

String sanitizeString(String input) {
  return input.replaceAllMapped(RegExp(r'[\x00-\x1F"\\]'), (match) {
    switch (match.group(0)) {
      case '"':
        return r'\"';
      case '\\':
        return r'\\';
      case '\b':
        return r'\b';
      case '\f':
        return r'\f';
      case '\n':
        return r'\n';
      case '\r':
        return r'\r';
      case '\t':
        return r'\t';
      default:
        return '';
    }
  });
}
