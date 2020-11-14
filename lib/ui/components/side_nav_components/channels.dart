import 'package:flutter/material.dart';

import 'package:flutterPlayground/application/app.dart';
import 'package:flutterPlayground/application/models/user.dart';

import 'package:flutterPlayground/ui/app_colors.dart';
import 'package:flutterPlayground/ui/avatar_handler.dart';
import 'package:flutterPlayground/ui/components/particles/circle_image.dart';
import 'package:flutterPlayground/ui/components/particles/holder.dart';

class Channels extends StatefulWidget {
  @override
  _ChannelsState createState() {
    _ChannelsState state = _ChannelsState(user: App.shared.user);
    App.shared.subscribe(state);
    return state;
  }
}

class _ChannelsState extends State<Channels> implements AppInitListener {
  User user;
  _ChannelsState({@required this.user});

  @override
  void onUserFetched(User user) {
    this.user = user;
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return Container();
    }
    return Column(
      children: List<Widget>.from(user.spaces[0].channelGroups.expand((group) {
        return [
          _Channel.group(name: group.name),
          ...group.channels.map((channel) => _Channel(name: channel.name)),
        ];
      })),
    );
  }
}

class _Channel extends StatelessWidget {
  final String name;
  final bool isGroup;
  _Channel({@required this.name}) : this.isGroup = false;
  _Channel.group({@required this.name}) : this.isGroup = true;
  @override
  Widget build(BuildContext context) {
    double padding = 6.0;
    double leftPadding = isGroup ? padding : padding * 3.3;
    return Holder.transparent(
      Row(
        children: <Widget>[
          Expanded(
              child: Text(
            isGroup ? name : "#$name",
            style: TextStyle(
                fontWeight: isGroup ? FontWeight.w700 : FontWeight.w400),
          )),
          Icon(
            Icons.more_vert,
            color: isGroup ? AppColors.text : AppColors.disabled,
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(leftPadding, padding, padding, padding),
    );
  }
}
