import 'package:flutter/material.dart';
import 'package:flutterPlayground/app_colors.dart';
import 'package:flutterPlayground/components/particles/circle_image.dart';
import 'package:flutterPlayground/components/particles/holder.dart';

class SideNav extends StatefulWidget {
  @override
  _SideNavState createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
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
                  child: Holder(Text('My Spaces'),
                      margin: EdgeInsets.only(bottom: 1.5)),
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
                      ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) =>
                            CircleImage(
                          image: NetworkImage("http://lorempixel.com/300/300"),
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          height: 8,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(child: Holder(Text("Cafe Hollywood"))),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: Holder(
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("View Space"),
                                    Text("Create a Channel"),
                                    Text("Manage Channels"),
                                    Text("Invite Friends"),
                                  ],
                                )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child:
                      Holder(Text('Footer'), margin: EdgeInsets.only(top: 1.5)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
