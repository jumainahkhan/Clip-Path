import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClipPathWidget(),
    );
  }
}

class ClipPathWidget extends StatefulWidget {
  @override
  State<ClipPathWidget> createState() => _ClipPathWidgetState();
}

class _ClipPathWidgetState extends State<ClipPathWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          Stack(
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
          ),
          const SizedBox(
            height: 100,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Positioned.fill(
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
                Container(
                  height: 50,
                  width: 200,
                  // decoration: BoxDecoration(
                  //   boxShadow: [
                  //     const BoxShadow(
                  //       color: Colors.white,
                  //     ),
                  //     BoxShadow(
                  //       color: HexColor("#0038FF"),
                  //       offset: Offset(0, 20),
                  //       blurRadius: 5,
                  //       spreadRadius: 10,
                  //     )
                  //   ],
                  // ),
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
        ],
      ),
    );
  }
}

class HexagonalClipperPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
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
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.0
      ..strokeCap = StrokeCap.round
      ..color = HexColor("#caecff");
    // ..maskFilter = MaskFilter.blur(BlurStyle.inner, convertRadiusToSigma(3));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }
}

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
