import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  var radius = 8.0;
  var dis = 5.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - dis);
    path.arcToPoint(
      Offset(dis, size.height),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(size.width - dis, size.height * 0.8);
    path.arcToPoint(
      Offset(size.width, size.height * 0.8 - dis),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(size.width, size.height - (size.height * 0.8) + dis);
    path.arcToPoint(
      Offset(size.width - dis, size.height - (size.height * 0.8)),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(dis, 0);
    path.arcToPoint(
      Offset(0, dis),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
