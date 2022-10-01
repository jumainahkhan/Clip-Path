import 'package:electroshoe_onboarding/Screen/HomePage/Models/HexagonalClipper.dart';
import 'package:electroshoe_onboarding/Screen/HomePage/Models/HexagonalClipperPainter.dart';
import 'package:flutter/material.dart';

Widget HexagonImage() {
  return Stack(
    children: [
      Center(
        child: ClipPath(
          clipper: HexagonalClipper(),
          child: Image.asset(
            'assets/Images/monkeynft3.jpeg',
          ),
        ),
      ),
      Center(
        child: CustomPaint(
          painter: HexagonalClipperPainter(),
          child: Container(
            height: 350,
            width: 486,
          ),
        ),
      )
    ],
  );
}
