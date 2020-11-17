import 'package:flutter/material.dart';
import 'package:flutterPlayground/ui/app_colors.dart';

class Holder extends StatelessWidget {
  final Widget content;
  final Color backgroundColor;
  final EdgeInsets margin;
  final EdgeInsets padding;

  Holder(this.content,
      {this.margin = const EdgeInsets.all(0.0),
      this.padding = const EdgeInsets.all(12.0)})
      : backgroundColor = AppColors.theme.highlightBackground;

  Holder.transparent(this.content,
      {this.margin = const EdgeInsets.all(0.0),
      this.padding = const EdgeInsets.all(12.0)})
      : backgroundColor = AppColors.theme.transparent;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: content,
      margin: margin,
      padding: padding,
      color: backgroundColor,
    );
  }
}
