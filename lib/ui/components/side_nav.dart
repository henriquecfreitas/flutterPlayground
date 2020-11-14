import 'package:flutter/material.dart';
import 'package:flutterPlayground/ui/app_colors.dart';

import 'package:flutterPlayground/ui/components/particles/holder.dart';
import 'package:flutterPlayground/ui/components/side_nav_components/channels.dart';
import 'package:flutterPlayground/ui/components/side_nav_components/channels_and_options.dart';

import 'package:flutterPlayground/ui/components/side_nav_components/footer.dart';
import 'package:flutterPlayground/ui/components/side_nav_components/header.dart';
import 'package:flutterPlayground/ui/components/side_nav_components/options.dart';
import 'package:flutterPlayground/ui/components/side_nav_components/spaces.dart';

class SideNav extends StatefulWidget {
  @override
  _SideNavState createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  final EdgeInsets headerMargin = EdgeInsets.only(bottom: 1.5);
  final EdgeInsets footerMargin = EdgeInsets.only(top: 1.5);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.darkBackground,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Holder(Header(), margin: headerMargin),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Holder.transparent(
                      Spaces(),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: ChannelsAndOptions(),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Holder(
                    Footer(),
                    margin: footerMargin,
                    padding: EdgeInsets.fromLTRB(5.0, 0.0, 2.0, 0.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
