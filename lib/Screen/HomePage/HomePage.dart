import 'package:electroshoe_onboarding/Screen/HomePage/Component/HomePageBody.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: HexColor("#2c1d58"),
        title: const Text("Electroshoe Project"),
      ),
      backgroundColor: Colors.white,
      body: const HomePageBody(),
    );
  }
}
