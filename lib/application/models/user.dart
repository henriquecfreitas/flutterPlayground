import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutterPlayground/application/models/space.dart';

import 'avatar_data.dart';

class User {
  final int id;
  final String name;
  final List<Space> spaces;
  AvatarData avatarData;
  User(
      {@required this.id,
      @required this.name,
      AvatarData avatarData,
      List<Space> spaces})
      : this.avatarData = avatarData,
        this.spaces = spaces ?? [];

  void addSpace(Space space) {
    this.spaces.add(space);
  }

  static User fromJson(String json) {
    Map<String, dynamic> data = jsonDecode(json);
    assert(data.containsKey('id'));
    assert(data.containsKey('name'));
    AvatarData avatarData;
    if (data.containsKey('avatarData')) {
      avatarData = AvatarData.fromJson(data['avatarData']);
    }
    List<Space> spaces;
    if (data.containsKey('spaces')) {
      spaces = List<Space>.from(data['spaces'].map(Space.fromData));
    }
    return User(
        id: data['id'],
        name: data['name'],
        avatarData: avatarData,
        spaces: spaces);
  }
}
