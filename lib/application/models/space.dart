import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'avatar_data.dart';

class Space {
  final int id;
  final String name;
  AvatarData avatarData;
  Space({@required this.id, @required this.name, AvatarData avatarData})
      : this.avatarData = avatarData;

  static Space fromData(dynamic data) {
    assert(data.containsKey('id'));
    assert(data.containsKey('name'));
    AvatarData avatarData;
    if (data.containsKey('avatarData')) {
      avatarData = AvatarData.fromJson(data['avatarData']);
    }
    return Space(id: data['id'], name: data['name'], avatarData: avatarData);
  }

  static Space fromJson(String json) {
    Map<String, dynamic> data = jsonDecode(json);
    return fromData(data);
  }
}
