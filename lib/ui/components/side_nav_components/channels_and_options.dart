import 'package:flutter/material.dart';

import 'package:flutterPlayground/ui/components/particles/holder.dart';
import 'package:flutterPlayground/ui/components/side_nav_components/channels.dart';
import 'package:flutterPlayground/ui/components/side_nav_components/options.dart';

class ChannelsAndOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(child: Holder(Channels())),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Holder(
                      Row(
                        children: <Widget>[
                          Expanded(child: Options()),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
