import 'package:flutter/material.dart';
import 'package:flutterPlayground/ui/app_colors.dart';
import 'package:flutterPlayground/ui/components/content_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.theme.darkBackground,
      child: Center(
        child: ContentView(),
      ),
    );
  }
}
