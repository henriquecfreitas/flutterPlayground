import 'package:flutter/material.dart';

import 'package:flutterPlayground/application/app.dart';

import 'package:flutterPlayground/application/models/user.dart';

import 'package:flutterPlayground/ui/avatar_handler.dart';
import 'package:flutterPlayground/ui/components/particles/circle_image.dart';
import 'package:flutterPlayground/ui/components/particles/holder.dart';

class Footer extends StatefulWidget {
  @override
  _FooterState createState() {
    _FooterState state = _FooterState(user: App.shared.user);
    App.shared.subscribeAppInit(state);
    return state;
  }
}

class _FooterState extends State<Footer> implements AppInitListener {
  User user;
  _FooterState({@required this.user});

  @override
  void onUserFetched(User user) {
    setState(() {
      this.user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return Container();
    }
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: CircleImage(
              image: user.avatarData.imageProvider(),
            )),
        Expanded(
          flex: 6,
          child: Holder.transparent(Text('@${user.name}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ))),
        ),
        Expanded(
          flex: 1,
          child: Icon(Icons.lock),
        ),
        Expanded(
          flex: 1,
          child: Icon(Icons.settings),
        ),
        Expanded(
          flex: 1,
          child: Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}
