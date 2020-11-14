import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutterPlayground/application/models/channel_group.dart';

import 'avatar_data.dart';

class Space {
  final int id;
  final String name;
  AvatarData avatarData;
  final List<ChannelGroup> channelGroups;
  Space(
      {@required this.id,
      @required this.name,
      AvatarData avatarData,
      List<ChannelGroup> channelGroups})
      : this.avatarData = avatarData,
        this.channelGroups = channelGroups ?? [];

  static Space fromData(dynamic data) {
    assert(data.containsKey('id'));
    assert(data.containsKey('name'));
    AvatarData avatarData;
    if (data.containsKey('avatarData')) {
      avatarData = AvatarData.fromJson(data['avatarData']);
    }
    List<ChannelGroup> channelGroups;
    if (data.containsKey('channelGroups')) {
      channelGroups = List<ChannelGroup>.from(
          data['channelGroups'].map(ChannelGroup.fromData));
    }

    return Space(
        id: data['id'],
        name: data['name'],
        avatarData: avatarData,
        channelGroups: channelGroups);
  }

  static Space fromJson(String json) {
    Map<String, dynamic> data = jsonDecode(json);
    return fromData(data);
  }
}
