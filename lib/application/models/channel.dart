import 'dart:convert';
import 'package:flutter/foundation.dart';

class Channel {
  final String name;
  Channel({@required this.name});

  static Channel fromData(dynamic data) {
    assert(data.containsKey('name'));
    return Channel(name: data['name']);
  }

  static Channel fromJson(String json) {
    Map<String, dynamic> data = jsonDecode(json);
    return fromData(data);
  }
}
