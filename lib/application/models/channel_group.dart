import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:flutterPlayground/application/models/channel.dart';

class ChannelGroup {
  final String name;
  final List<Channel> channels;
  ChannelGroup({@required this.name, List<Channel> channels})
      : this.channels = channels ?? [];

  static ChannelGroup fromData(dynamic data) {
    assert(data.containsKey('name'));
    List<Channel> channels;
    if (data.containsKey('textChannels')) {
      channels = List<Channel>.from(data['textChannels'].map(Channel.fromData));
    }
    return ChannelGroup(name: data['name'], channels: channels);
  }

  static ChannelGroup fromJson(String json) {
    Map<String, dynamic> data = jsonDecode(json);
    return fromData(data);
  }
}
