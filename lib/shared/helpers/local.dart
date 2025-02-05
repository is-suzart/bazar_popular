import 'package:hive_flutter/hive_flutter.dart';

Future<dynamic> getInstance(String instance) async {
  final box = await Hive.openBox('appBox');
  return box.get(instance);
}

Future<void> setInstance(String instance, dynamic value) async {
  final box = await Hive.openBox('appBox');
  await box.put(instance, value);
}

Future<void> removeInstance(String instance) async {
  final box = await Hive.openBox('appBox');
  await box.delete(instance);
}

String setImageUrl(String? url) {
  const String apiUrl = 'http://localhost:8080';
  if (url != null) {
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
