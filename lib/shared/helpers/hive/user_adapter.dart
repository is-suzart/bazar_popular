import 'dart:convert';

import 'package:bazar_popular/models/user_models.dart';
import 'package:hive/hive.dart';

class UserAdapter extends TypeAdapter<UserModels> {
  @override
  final int typeId = 1;

  @override
  UserModels read(BinaryReader reader) {
    return UserModels(
      id: reader.read(),
      name: reader.read(),
      email: reader.read(),
      telephone: reader.read(),
      state: reader.read(),
      city: reader.read(),
      role: reader.read(),
      profilePicture: reader.read(),
      created: reader.read(),
      updated: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, UserModels obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.email);
    writer.write(obj.telephone);
    writer.write(obj.state);
    writer.write(obj.city);
    writer.write(obj.role);
    writer.write(obj.profilePicture);
    writer.write(obj.created);
    writer.write(obj.updated);
  }
}
