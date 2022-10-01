import 'package:electroshoe_onboarding/Screen/HomePage/Component/HexagonImage.dart';
import 'package:electroshoe_onboarding/Screen/HomePage/Models/HexagonalClipper.dart';
import 'package:electroshoe_onboarding/Screen/HomePage/Models/HexagonalClipperPainter.dart';
import 'package:electroshoe_onboarding/Screen/HomePage/Component/VerifyButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        HexagonImage(),
        const SizedBox(
          height: 50,
        ),
        verifyButton()
      ],
    );
  }
}
