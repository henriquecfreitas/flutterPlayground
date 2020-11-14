import 'package:flutter/material.dart';
import 'package:flutterPlayground/ui/app_colors.dart';

import 'package:flutterPlayground/ui/components/particles/holder.dart';

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _OptionsItem(title: "View Space", icon: Icons.people),
        _OptionsItem(title: "Create a Channel", icon: Icons.add_circle),
        _OptionsItem(title: "Manage Channels", icon: Icons.message_rounded),
        _OptionsItem(title: "Invite Friends", icon: Icons.person_add),
      ],
    );
  }
}

class _OptionsItem extends StatelessWidget {
  final String title;
  final IconData icon;
  _OptionsItem({@required this.title, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Holder.transparent(Icon(
          icon,
          color: AppColors.highlightText,
        )),
        Text(
          title,
          style: TextStyle(
              color: AppColors.highlightText, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
