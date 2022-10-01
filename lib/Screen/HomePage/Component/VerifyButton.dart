import 'package:electroshoe_onboarding/Screen/HomePage/Models/InnerShadow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

Widget verifyButton() {
  return Container(
    color: Colors.black,
    height: 80,
    width: 250,
    child: Center(
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned.fill(
                child: InnerShadow(
                  blur: 10,
                  color: HexColor("#FFFFFF"),
                  offset: const Offset(2, 1),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          center: Alignment(0, 155),
                          tileMode: TileMode.mirror,
                          focalRadius: 1,
                          //focal: Alignment.bottomCenter,

                          radius: 4,
                          colors: <HexColor>[
                            HexColor("#FF7DB9"),
                            HexColor("#F72585"),
                            HexColor("#0038FF"),
                          ],
                          // begin: Alignment.topCenter,
                          // end: Alignment.bottomCenter),
                        ),
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.white,
                          ),
                          BoxShadow(
                            color: HexColor("#0038FF"),
                            offset: Offset(0, 20),
                            blurRadius: 5,
                            spreadRadius: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Verify',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      shadows: [
                        Shadow(
                            color: HexColor("#F72585"),
                            offset: const Offset(1, 3),
                            blurRadius: 8),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
