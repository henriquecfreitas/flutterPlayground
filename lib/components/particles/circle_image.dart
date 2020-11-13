import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final ImageProvider image;
  final double radius;
  CircleImage({this.radius, this.image});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: radius, backgroundImage: image);
  }
}
