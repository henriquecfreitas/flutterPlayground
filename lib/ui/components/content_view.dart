import 'package:flutter/material.dart';
import 'package:flutterPlayground/ui/components/code_sheet.dart';

class ContentView extends StatefulWidget {
  @override
  State<ContentView> createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  @override
  Widget build(BuildContext context) {
    return CodeSheet();
  }
}
