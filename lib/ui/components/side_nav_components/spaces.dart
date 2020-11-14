import 'package:flutter/material.dart';

import 'package:flutterPlayground/application/app.dart';
import 'package:flutterPlayground/application/models/user.dart';

import 'package:flutterPlayground/ui/avatar_handler.dart';
import 'package:flutterPlayground/ui/components/particles/circle_image.dart';

class Spaces extends StatefulWidget {
  @override
  _SpacesState createState() {
    _SpacesState state = _SpacesState(user: App.shared.user);
    App.shared.subscribe(state);
    return state;
  }
}

class _SpacesState extends State<Spaces> implements AppInitListener {
  User user;
  _SpacesState({@required this.user});

  @override
  void onUserFetched(User user) {
    this.user = user;
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return Container();
    }
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: user.spaces.length,
      itemBuilder: (BuildContext context, int index) => CircleImage(
        image: user.spaces[index].avatarData.imageProvider(),
      ),
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 8,
      ),
    );
  }
}
