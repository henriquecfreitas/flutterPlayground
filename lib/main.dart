import 'package:flutter/material.dart';

import 'package:flutterPlayground/application/app.dart';
import 'package:flutterPlayground/ui/app_colors.dart';

import 'package:flutterPlayground/ui/components/side_nav.dart';
import 'package:flutterPlayground/ui/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    App.shared.init(context);

    return MaterialApp(
      title: 'Spaces',
      theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: AppColors.theme.text,
                displayColor: AppColors.theme.text,
                decorationColor: AppColors.theme.text,
              ),
          iconTheme: Theme.of(context)
              .iconTheme
              .copyWith(color: AppColors.theme.highlightText)),
      home: Scaffold(
        appBar: new AppBar(
          title: const Text('Title'),
        ),
        drawer: SideNav(),
        body: Home(),
      ),
    );
  }
}
