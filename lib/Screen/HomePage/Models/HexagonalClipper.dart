import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HexagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, (size.height / 2) - 30);
    path.moveTo((size.width / 4) - 80, (size.height / 2) - 30);
    final firstEndPoint = Offset((size.width / 4) - 80, (size.height / 2) + 30);
    final firstControlPoint = Offset(0, size.height / 2); //317,22
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo((size.width / 4) - 15, size.height - 30);
    final secondControlPoint = Offset(size.width / 4, size.height);
    final secondEndPoint = Offset((size.width / 4) + 40, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(((3 * size.width) / 4) - 40, size.height);
    final thirdControlPoint = Offset((3 * size.width) / 4, size.height);
    final thirdEndPoint = Offset(((3 * size.width) / 4) + 15, size.height - 30);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);
    path.lineTo(size.width - 15, (size.height / 2) + 30);
    final fourthControlPoint = Offset(size.width, size.height / 2);
    final fourthEndPoint = Offset(size.width - 15, (size.height / 2) - 30);
    path.quadraticBezierTo(fourthControlPoint.dx, fourthControlPoint.dy,
        fourthEndPoint.dx, fourthEndPoint.dy);

    path.lineTo(((3 * size.width) / 4) + 15, (size.height / 4) - 60);
    final fifthControlPoint = Offset((3 * size.width) / 4, 0);
    final fifthEndPoint = Offset(((3 * size.width) / 4) - 60, 0);
    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy,
        fifthEndPoint.dx, fifthEndPoint.dy);
    path.lineTo((size.width / 4) + 40, 0);
    final sixthControlPoint = Offset(size.width / 4, 0);
    final sixthEndPoint = Offset((size.width / 4) - 15, (size.height / 4) - 60);
    path.quadraticBezierTo(sixthControlPoint.dx, sixthControlPoint.dy,
        sixthEndPoint.dx, sixthEndPoint.dy);

    path.lineTo((size.width / 4) - 80, (size.height / 2) - 30);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
