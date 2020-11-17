import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:flutterPlayground/application/models/avatar_data.dart';

extension AvatarHandler on AvatarData {
  ImageProvider imageProvider() {
    switch (type) {
      case AvatarType.URL:
        return NetworkImage(value);
      case AvatarType.MEMORY:
        Uint8List imageData = Base64Decoder().convert(value);
        return MemoryImage(imageData);
      default:
        return AssetImage("assets/images/default_avatar.png");
    }
  }
}
