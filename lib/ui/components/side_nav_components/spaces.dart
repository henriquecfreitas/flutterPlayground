import 'package:flutter/material.dart';

import 'package:flutterPlayground/application/app.dart';
import 'package:flutterPlayground/application/models/space.dart';
import 'package:flutterPlayground/application/models/user.dart';

import 'package:flutterPlayground/ui/app_colors.dart';
import 'package:flutterPlayground/ui/avatar_handler.dart';
import 'package:flutterPlayground/ui/components/particles/circle_image.dart';

class Spaces extends StatefulWidget {
  @override
  _SpacesState createState() {
    _SpacesState state = _SpacesState(user: App.shared.user);
    App.shared.subscribeAppInit(state);
    return state;
  }
}

class _SpacesState extends State<Spaces> implements AppInitListener {
  User user;
  _SpacesState({@required this.user});

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
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: user.spaces.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index >= user.spaces.length) {
          return Icon(
            Icons.search,
            color: AppColors.highlightText,
          );
        }
        Space space = user.spaces[index];
        return InkWell(
          onTap: () => App.shared.selectSpace(space),
          child: CircleImage(
            image: space.avatarData.imageProvider(),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 8,
      ),
    );
  }
}
