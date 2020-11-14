import 'package:flutter/material.dart';

import 'package:flutterPlayground/application/app.dart';

import 'package:flutterPlayground/application/models/user.dart';

import 'package:flutterPlayground/ui/avatar_handler.dart';
import 'package:flutterPlayground/ui/components/particles/circle_image.dart';

class Footer extends StatefulWidget {
  @override
  _FooterState createState() {
    _FooterState state = _FooterState(user: App.shared.user);
    App.shared.subscribe(state);
    return state;
  }
}

class _FooterState extends State<Footer> implements AppInitListener {
  User user;
  _FooterState({@required this.user});

  @override
  void onUserFetched(User user) {
    this.user = user;
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return Container();
    }
    return Row(
      children: <Widget>[
        Expanded(
            flex: 2,
            child: CircleImage(image: user.avatarData.imageProvider())),
        Expanded(
          flex: 8,
          child: Text('@${user.name}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              )),
        ),
      ],
    );
  }
}
