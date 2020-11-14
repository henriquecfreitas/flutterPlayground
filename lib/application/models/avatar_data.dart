import 'package:flutter/foundation.dart';
import 'package:flutterPlayground/application/errors/invalid_data.dart';

enum AvatarType {
  URL,
  MEMORY,
}

class AvatarData {
  final AvatarType type;
  final String value;
  AvatarData({@required this.type, @required this.value});
  static AvatarData fromJson(Map<String, dynamic> json) {
    assert(json.containsKey('type'));
    assert(json.containsKey('value'));
    AvatarType type = avatarTypeFromString(json['type']);
    return AvatarData(type: type, value: json['value']);
  }

  static AvatarType avatarTypeFromString(String avatarType) {
    switch (avatarType) {
      case "URL":
        return AvatarType.URL;
      case "MEMORY":
        return AvatarType.MEMORY;
      default:
        throw InvalidData();
    }
  }
}
